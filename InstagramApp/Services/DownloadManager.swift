import SwiftUI
import Alamofire

class DownloadManager {
    let token = "token"
    let tokenvalue = "0118a46e-50df-4c72-8442-63043b863a69"
    let domen = "https://backendapppoint.space/"

//    func postTikTokRequest(link: String ,completionHandler: @escaping (String) -> ()) {
//        let URLString = "\(domen)api/tiktokDownload"
//        let parameters: [String:String] = [ "url": link, token: tokenvalue ]
//        let url = URL(string: URLString)!
//        AF.request(url, method: .post, parameters: parameters)
//          .validate()
//          .responseDecodable(of: DownloadLinkResponse.self) { response in
//                switch response.result {
//                case .success(let receivedData):
//                    print("TikTokDownload response.error : \(String(describing: receivedData.error))")
//                    print("TikTokDownload response.messages = \(String(describing: receivedData.messages.count))")
//                    let tikTokdownloadLink: String = receivedData.data.url
//                    completionHandler(tikTokdownloadLink)
//                case .failure(let error):
//                    print("Ошибка получения данных TikTokDownload: \(error)")
//                }
//            }
//    }

//    func getClipInfo(link: String ,completionHandler: @escaping (AFDataResponse<ClipInfoResponse>) -> ()) {
//        let URLString = "\(domen)api/clipInfo?url=https://vt.tiktok.com/ZS2c7RWu6/"
//        let parameters: [String:String] = [ "url": link, token: tokenvalue ]
//        let url = URL(string: URLString)!
//        AF.request(url, method: .get, parameters: parameters)
//          .validate()
//          .responseDecodable(of: ClipInfoResponse.self) { response in
//              completionHandler(response)
//            }
//    }

    func getMusicTrends(completionHandler: @escaping ([SectionModel]) -> ()) {
        let URLString = "\(domen)api/collection?lang=en"
        let parameters: [String:String] = [ token: tokenvalue ]
        let url = URL(string: URLString)!

        AF.request(url, method: .get, parameters: parameters)
          .validate()
          .responseDecodable(of: TrendsResponse.self) { response in
                switch response.result {
                case .success(let receivedData):
                    print("MusicTrends response.error : \(String(describing: receivedData.error))")
                    print("MusicTrends response.messages = \(String(describing: receivedData.messages.count))")
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
