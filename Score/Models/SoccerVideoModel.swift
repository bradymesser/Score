//
//  SoccerVideoModel.swift
//  Score
//
//  Created by Brady on 5/11/19.
//  Copyright © 2019 William Messer. All rights reserved.
//

import Foundation

struct SoccerVideoModel {
    let title: String
    let embed: String
    let url: String
    let thumbnail: String
    let side1: Side
    let side2: Side
    let competition: Competition
    let videos: [Video]
}

struct Side {
    let name: String
    let url: String
}

struct Competition {
    let name: String
    let id: Int
    let url: String
}

struct Video {
    let title: String
    let embed: String
}
