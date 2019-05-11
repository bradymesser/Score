//
//  VideoViewController.swift
//  Score
//
//  Created by Brady on 5/11/19.
//  Copyright © 2019 William Messer. All rights reserved.
//

import Foundation
import UIKit

class VideoViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        var videos = getSoccerVideos()
    }
}

class CustomCell: UITableViewCell {
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var label: UILabel!
}
