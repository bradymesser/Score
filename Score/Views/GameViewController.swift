import Foundation
import UIKit
import WebKit

//displays all videos for a game, as well as the competition and the two teams playing
class GameViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var sides: UILabel!
    @IBOutlet weak var competition: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var thumbnail: UIImageView!
    
    var game: SoccerVideoModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        sides.text = (game?.side1.name)! + " vs. " + (game?.side2.name)!
        competition.text = game?.competition.name
        thumbnail.image = getSoccerVideoThumbnail(url: game?.thumbnail ?? "")
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
        tableView.deselectRow(at: indexPath, animated: false)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destination = storyboard.instantiateViewController(withIdentifier: "VideoViewer") as! VideoViewer
        destination.html = game?.videos[indexPath.row].embed
        navigationController?.pushViewController(destination, animated: true)
    }
    
}

//Displays a selected video
class VideoViewer: UIViewController {
    var html: String?
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.loadHTMLString(html ?? "<h1>Error loading video.</h1>", baseURL: nil)
    }
}
