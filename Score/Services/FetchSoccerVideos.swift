import Foundation
import PromiseKit

var videos: [SoccerVideoModel] = []

func getSoccerVideos() -> [SoccerVideoModel] {
    let decoder = JSONDecoder.init()
//    var videos: [SoccerVideoModel] = []
    let url = URL(string: "https://www.scorebat.com/video-api/v1/")
    let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
        if error == nil {
            videos = try! decoder.decode([SoccerVideoModel].self, from: data!)
        }
        else {
            print("ERROR")
        }
    }.resume()
    return videos
}
