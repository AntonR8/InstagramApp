import SwiftUI
import Photos
import Observation

struct ComplexStoriesModel: Hashable {
    let stories: StoriesModel
    let profileStories: [ProfileStoriesModel]
}


@Observable
final class MainViewModel {
    var path = NavigationPath()
    var showWrongLinkAlert = false
    var showDownloading = false
    var reelsdownloadLink: String = ""

    // fetch request:
    func findButtonPushed(link: String) {
        let linkType = returnLinkType(link: link)
        switch linkType {
        case .reels: do { self.getReelsData(link: link) }
        case .stories: do { self.getStoriesData(link: link) }
        case .posts: do { self.getPostData(link: link) }
        default: do { self.getProfileData(link: link) }
        }

        self.showDownloading = true
    }

    func returnLinkType(link: String) -> CollectionType {
        let link = link.dropFirst(26)
        if link.hasPrefix("reel/") { return .reels }
        else if link.hasPrefix("stories/") { return .stories }
        else if link.hasPrefix("p/") { return .posts}
        else { return .profiles }
    }

    func getReelsData(link: String) {
        DownloadManager().getReelsData(link: link) {receivedResponse in
            switch receivedResponse.result {
            case .success(let receivedData):
                print("ReelsInfo response.error : \(String(describing: receivedData.error))")
                print("ReelsInfo response.messages = \(String(describing: receivedData.messages.count))")
                let receivedReelsInfo = receivedData.data
                if receivedReelsInfo.reels.videoDownloadUrl.isEmpty {
                    print("receivedReelsInfo.videoDownloadURL.isEmpty")
                    self.showDownloading = false
                    self.showWrongLinkAlert = true
                } else {
                    self.path.append(receivedReelsInfo.reels)
                    self.showDownloading = false
                }
            case .failure(let error):
                print("Ошибка получения данных reels: \(error)")
                self.showDownloading = false
                self.showWrongLinkAlert = true
            }
        }
    }

    func getPostData(link: String) {
        DownloadManager().getPostData(link: link) { receivedResponse in
            switch receivedResponse.result {
            case .success(let receivedData):
                print("PostData response.error : \(String(describing: receivedData.error))")
                print("PostData response.messages = \(String(describing: receivedData.messages.count))")
                let receivedPosstInfo = receivedData.data
                if let first = receivedPosstInfo.post.carousel.first {
                    if let imageDownloadUrl = first.imageDownloadUrl {
                        if imageDownloadUrl.isEmpty {
                            print("receivedPosstInfo.post.carousel.isEmpty")
                            self.showDownloading = false
                            self.showWrongLinkAlert = true
                        } else {
                            self.path.append(receivedPosstInfo.post)
                            self.showDownloading = false
                        }
                    }
                }
            case .failure(let error):
                print("Ошибка получения данных post: \(error)")
                self.showDownloading = false
                self.showWrongLinkAlert = true
            }
        }
    }

    func getProfileData(link: String) {
        DownloadManager().getProfileData(link: link) { receivedResponse in
            switch receivedResponse.result {
            case .success(let receivedData):
                print("ProfileData response.error : \(String(describing: receivedData.error))")
                print("ProfileData response.messages = \(String(describing: receivedData.messages.count))")
                let receivedProfileData = receivedData.data
                if receivedProfileData.profile.name.isEmpty {
                    print("receivedPosstInfo.post.carousel.isEmpty")
                    self.showDownloading = false
                    self.showWrongLinkAlert = true
                } else {
                    self.path.append(receivedProfileData.profile)
                    self.showDownloading = false
                }
            case .failure(let error):
                print("Ошибка получения данных profile: \(error)")
                self.showDownloading = false
                self.showWrongLinkAlert = true
            }
        }
    }

    func getStoriesData(link: String) {
        DownloadManager().getStoriesData(link: link) { receivedResponse in
            switch receivedResponse.result {
            case .success(let receivedData):
                print("StoriesData response.error : \(String(describing: receivedData.error))")
                print("StoriesData response.messages = \(String(describing: receivedData.messages.count))")
                let receivedStoriesData = receivedData.data
                if let imageDownloadUrl = receivedStoriesData.story.imageDownloadUrl {
                    if imageDownloadUrl.isEmpty {
                        print("receivedStoriesData.stories.imageDownloadUrl.isEmpty")
                        self.showDownloading = false
                        self.showWrongLinkAlert = true
                    } else {
                        if let authorProfile = receivedStoriesData.story.authorProfile {
                            self.getProfileStoriesData(link: authorProfile, stories: receivedStoriesData.story)
                        } else {
                            self.showDownloading = false
                            self.path.append(receivedStoriesData.story)
                        }
                    }
                }  else {
                    if let authorProfile = receivedStoriesData.story.authorProfile {
                        self.getProfileStoriesData(link: authorProfile, stories: receivedStoriesData.story)
                    } else {
                        self.showDownloading = false
                        self.path.append(receivedStoriesData.story)
                    }
                }
            case .failure(let error):
                print("Ошибка получения данных stories: \(error)")
                self.showDownloading = false
                self.showWrongLinkAlert = true
            }
        }
    }

    func getProfileStoriesData(link: String, stories: StoriesModel) {
        DownloadManager().getProfileStoriesData(link: link) { receivedResponse in
            switch receivedResponse.result {
            case .success(let receivedData):
                print("ProfileStoriesData response.error : \(String(describing: receivedData.error))")
                print("ProfileStoriesData response.messages = \(String(describing: receivedData.messages.count))")
                let receivedProfileStoriesData = receivedData.data
                if let first = receivedProfileStoriesData.profileStories.items.first {
                    if first.imageDownloadUrl.isEmpty {
                        print("receivedStoriesData.stories.imageDownloadUrl.isEmpty")
                        self.showDownloading = false
                        self.showWrongLinkAlert = true
                    
                } else {
                    self.path.append(ComplexStoriesModel(stories: stories, profileStories: receivedProfileStoriesData.profileStories.items))
                    self.showDownloading = false
                }
            }
            case .failure(let error):
                print("Ошибка получения данных profileStories: \(error)")
                self.showDownloading = false
                self.showWrongLinkAlert = true
            }
        }
    }

}
