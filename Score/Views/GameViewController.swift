//
//  GameViewController.swift
//  Score
//
//  Created by Brady on 5/11/19.
//  Copyright © 2019 William Messer. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class GameViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var sides: UILabel!
    @IBOutlet weak var competition: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var game: SoccerVideoModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        sides.text = (game?.side1.name)! + " vs. " + (game?.side2.name)!
        competition.text = game?.competition.name
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return game?.videos.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = game?.videos[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destination = storyboard.instantiateViewController(withIdentifier: "VideoViewer") as! VideoViewer
        destination.html = game?.videos[indexPath.row].embed
        navigationController?.pushViewController(destination, animated: true)
    }
    
}

class VideoViewer: UIViewController {
    var html: String?
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.loadHTMLString(html!, baseURL: nil)
    }
}
