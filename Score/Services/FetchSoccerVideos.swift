import Foundation
import UIKit

func getSoccerVideos() -> [SoccerVideoModel] {
    let decoder = JSONDecoder.init()
    var videos: [SoccerVideoModel]?
    let url = URL(string: "https://www.scorebat.com/video-api/v1/")
    guard let data = try? Data(contentsOf: url!) else {
        print("Error retrieving data.")
        return []
    }
    videos = try? decoder.decode([SoccerVideoModel].self, from: data)
    
    return videos ?? []
}

func getSoccerVideoThumbnail(url: String) -> UIImage? {
    let url = URL(string: url)
    guard let data = try? Data(contentsOf: url!) else {
        print("Error retrieving data.")
        return nil
    }
    guard let img = UIImage(data: data) else {
        print("Error creating image.")
        return nil
    }
    return img
}
