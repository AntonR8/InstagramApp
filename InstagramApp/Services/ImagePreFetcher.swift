
import SDWebImageSwiftUI

final class ImagePreFetcher {
    static let shared = ImagePreFetcher()
    private let prefetcher = SDWebImagePrefetcher()
    
    private init() {}
    
    func startPrefetching(stringURLs: [String]) {
        let urls: [URL] = convertStringToURL(stringURLs: stringURLs)
        prefetcher.prefetchURLs(urls)
    }
    
    func stopPrefetching() {
        prefetcher.cancelPrefetching()
    }
    
    func convertStringToURL(stringURLs: [String]) -> [URL] {
        guard
            !stringURLs.isEmpty
        else { return [] }
        
        var urls: [URL] = []
        for stringURL in stringURLs {
            if let url = URL(string: stringURL) {
                urls.append(url)
            }
        }
        return urls
    }
        
}
