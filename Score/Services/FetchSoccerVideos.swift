import Foundation

func getSoccerVideos() -> [SoccerVideoModel] {
    let decoder = JSONDecoder.init()
    var videos: [SoccerVideoModel]?
    let url = URL(string: "https://www.scorebat.com/video-api/v1/")
    let data = try! Data(contentsOf: url!)
    videos = try? decoder.decode([SoccerVideoModel].self, from: data)
    
    return videos ?? []
}

