//
//  GameViewController.swift
//  Score
//
//  Created by Brady on 5/11/19.
//  Copyright © 2019 William Messer. All rights reserved.
//

import Foundation
import UIKit

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
        print(game?.videos[indexPath.row].embed)
        return cell
    }
    
}
