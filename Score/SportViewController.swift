//
//  SportViewController.swift
//  Score
//
//  Created by Brady on 5/11/19.
//  Copyright © 2019 William Messer. All rights reserved.
//

import Foundation
import UIKit

class SportViewController: UITableViewController {
    
    var sportLeague: [String] = ["League1","League2","League3"]
    override func viewDidLoad() {
        super.viewDidLoad()
        sportLeague = ["League1","League2","Leage3"]
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
