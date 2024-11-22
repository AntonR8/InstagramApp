import SwiftUI
import ApphudSDK
import Observation


@Observable
class TrendsViewModel {
    var trendsMusic: [SectionModel] = []
    var hasPremium: Bool = false

    init() {
        self.getTrendsMusic()
        self.hasPremium =  Apphud.hasPremiumAccess()
        print("hasPremium: \(self.hasPremium)")
    }

    func getTrendsMusic() {
        DownloadManager().getMusicTrends { trendsMusic in
            self.trendsMusic = trendsMusic
        }
    }
}
