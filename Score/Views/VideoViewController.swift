import Foundation
import UIKit

//Displays the list of games, tapping on a game takes you to a view that shows all the available videos for the game
class VideoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    var videos: [SoccerVideoModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if let cell = cell as? CustomCell {
            cell.textLabel?.text = videos[indexPath.row].title
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destination = storyboard.instantiateViewController(withIdentifier: "GameView") as! GameViewController
        destination.game = videos[indexPath.row]
        navigationController?.pushViewController(destination, animated: true)
    }
}

//Eventually should use the thumbnail to display the thumbnail for a game
class CustomCell: UITableViewCell {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var thumbnail: UIImageView!
}
