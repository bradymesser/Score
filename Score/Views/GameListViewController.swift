import Foundation
import UIKit

//Displays the list of games, tapping on a game takes you to a view that shows all the available videos for the game
class VideoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var videos: [SoccerVideoModel] = []
    var searchActive = false
    var filtered: [SoccerVideoModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchActive {
            return filtered.count
        }
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if let cell = cell as? CustomCell {
            if searchActive {
//                cell.textLabel?.text = filtered[indexPath.row].title
                cell.label.text = filtered[indexPath.row].title
                cell.thumbnail.image = getSoccerVideoThumbnail(url: filtered[indexPath.row].thumbnail)

            } else {
                cell.label.text = videos[indexPath.row].title
                cell.thumbnail.image = getSoccerVideoThumbnail(url: videos[indexPath.row].thumbnail)
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destination = storyboard.instantiateViewController(withIdentifier: "GameView") as! GameViewController
        if searchActive {
            destination.game = filtered[indexPath.row]
        } else {
            destination.game = videos[indexPath.row]
        }
        navigationController?.pushViewController(destination, animated: true)
    }
}

//Eventually should use the thumbnail to display the thumbnail for a game
class CustomCell: UITableViewCell {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var thumbnail: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        thumbnail.image = nil
    }
}

extension VideoViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_: UISearchBar) {
        searchActive = true
    }
    
    func searchBarTextDidEndEditing(_: UISearchBar) {
        searchActive = false
    }
    
    func searchBarCancelButtonClicked(_: UISearchBar) {
        searchActive = false
        filtered.removeAll(keepingCapacity: false)
        tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_: UISearchBar) {
        searchActive = false
    }
    
    func searchBar(_: UISearchBar, textDidChange searchText: String) {
        filtered.removeAll(keepingCapacity: false)
        for game in videos {
            if game.title.lowercased().contains(searchText.lowercased()) {
                filtered.append(game)
            }
        }
        if filtered.count == 0 {
            searchActive = false
        } else {
            searchActive = true
        }
        tableView.reloadData()
    }
}
