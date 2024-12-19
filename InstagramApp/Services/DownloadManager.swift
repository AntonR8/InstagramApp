import SwiftUI
import Alamofire

class DownloadManager {
    let token = Constants.BackEnd.token
    let tokenvalue = Constants.BackEnd.tokenvalue
    let domen = Constants.BackEnd.domen

    func getReelsData(link: String ,completionHandler: @escaping (AFDataResponse<ReelsResponse>) -> ()) {
        let URLString = "\(domen)api/reels"
        let parameters: [String:String] = [ "url": link, token: tokenvalue ]
        let url = URL(string: URLString)!
        AF.request(url, method: .get, parameters: parameters)
          .validate()
          .responseDecodable(of: ReelsResponse.self) { response in
              completionHandler(response)
            }
    }

    func getPostData(link: String ,completionHandler: @escaping (AFDataResponse<PostResponse>) -> ()) {
        let URLString = "\(domen)api/post"
        let parameters: [String:String] = [ "url": link, token: tokenvalue ]
        let url = URL(string: URLString)!
        AF.request(url, method: .get, parameters: parameters)
          .validate()
          .responseDecodable(of: PostResponse.self) { response in
              completionHandler(response)
            }
    }

    func getProfileData(link: String ,completionHandler: @escaping (AFDataResponse<ProfileResponse>) -> ()) {
        let URLString = "\(domen)api/profile"
        let parameters: [String:String] = [ "url": link, token: tokenvalue ]
        let url = URL(string: URLString)!
        AF.request(url, method: .get, parameters: parameters)
          .validate()
          .responseDecodable(of: ProfileResponse.self) { response in
              completionHandler(response)
            }
    }

    func getStoriesData(link: String ,completionHandler: @escaping (AFDataResponse<StoriesResponse>) -> ()) {
        let URLString = "\(domen)api/story"
        let parameters: [String:String] = [ "url": link, token: tokenvalue ]
        let url = URL(string: URLString)!
        AF.request(url, method: .get, parameters: parameters)
          .validate()
          .responseDecodable(of: StoriesResponse.self) { response in
              completionHandler(response)
            }
    }

    func getProfileStoriesData(link: String ,completionHandler: @escaping (AFDataResponse<ProfileStoriesResponse>) -> ()) {
        let URLString = "\(domen)api/profile/stories"
        let parameters: [String:String] = [ "url": link, token: tokenvalue ]
        let url = URL(string: URLString)!
        AF.request(url, method: .get, parameters: parameters)
          .validate()
          .responseDecodable(of: ProfileStoriesResponse.self) { response in
              completionHandler(response)
            }
    }

    func getMusicTrends(completionHandler: @escaping ([SectionModel]) -> ()) {
        let URLString = "\(domen)api/collection?lang=en"
        let parameters: [String:String] = [ token: tokenvalue, "n": "1" ]
        let url = URL(string: URLString)!

        AF.request(url, method: .get, parameters: parameters)
          .validate()
          .responseDecodable(of: TrendsResponse.self) { response in
                switch response.result {
                case .success(let receivedData):
                    print("MusicTrends response.error : \(String(describing: receivedData.error))")
                    print("MusicTrends response.messages = \(String(describing: receivedData.messages.count))")
                    print("MusicTrends: \(receivedData.data.count)")
                    let trendsMusic: [SectionModel] = receivedData.data
                    completionHandler(trendsMusic)
                case .failure(let error):
                    print("Ошибка получения данных trendsMusic: \(error)")
                }
            }
    }

    func downloadTrack(trackurl: String) async -> Data? {
        var mp3data: Data?
        let url = URL(string: trackurl)!
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            mp3data = data
        }
        catch let error { print("Error: \(error)") }
        return mp3data
    }
    
    func saveTrack(data: Data, name: String) {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            .appendingPathComponent(name + ".mp3")
        do {
            try data.write(to: path)
            print("Saved")
        } catch let error {
            print("Error: \(error)")
        }
    }

}
