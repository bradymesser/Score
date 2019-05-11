import Foundation

func getSoccerVideos() -> [SoccerVideoModel] {
    var videos: [SoccerVideoModel] = []
    let decoder = JSONDecoder.init()
    let url = URL(string: "https://www.scorebat.com/video-api/v1/")
    let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
        if error == nil {
            print(data)
        }
        else {
            print("ERROR")
        }
    }
    return videos
}
