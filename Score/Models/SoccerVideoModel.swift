import Foundation

struct SoccerVideoModel: Codable {
    let title: String
    let embed: String
    let url: String
    let thumbnail: String
    let side1: Side
    let side2: Side
    let competition: Competition
    let videos: [Video]
}

struct Side: Codable {
    let name: String
    let url: String
}

struct Competition: Codable {
    let name: String
    let id: Int
    let url: String
}

struct Video: Codable {
    let title: String
    let embed: String
}
