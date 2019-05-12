import Foundation
import UIKit

class SportViewController: UITableViewController {
    var sportLeague: [String] = ["League1","League2","League3"]
    var sport: String
    
    init() {
        sport = ""
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sportLeague = ["League1","League2","Leage3"]
    }
    
    func setSport(s: String) {
        sport = s
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sportLeague.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = sportLeague[indexPath.row]
        return cell
    }
    
    
}
