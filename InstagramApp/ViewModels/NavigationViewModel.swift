import SwiftUI
import Observation


@Observable
final class NavigationViewModel {
    var tabSelection = 1
    var showPaywall = false
    var launchScreenOpacity: Double = 1
    var albumViewIsShowing = false

    var numberOfSearches = 0
    var showRateMeView = false
    var hasRated = false {
        didSet { saveHasRated() }
    }
    var userViews: Int = 0 {
        didSet { saveUserViews() }
    }

    init() {
        loadHasRated()
        loadUserViews()
    }

    // init
    func saveHasRated() {
        if let encodedData = try? JSONEncoder().encode(hasRated) {
            UserDefaults.standard.setValue(encodedData, forKey: "hasRated")
        }
    }

    func loadHasRated() {
        guard
            let hasRatedData = UserDefaults.standard.data(forKey: "hasRated"),
            let receivedHasRated = try? JSONDecoder().decode(Bool.self, from: hasRatedData)
        else { return }
        self.hasRated = receivedHasRated
    }

    func saveUserViews() {
        if let encodedData = try? JSONEncoder().encode(userViews) {
            UserDefaults.standard.setValue(encodedData, forKey: "userViews")
        }
    }

    func loadUserViews() {
        guard
            let userViewsData = UserDefaults.standard.data(forKey: "userViews"),
            let receivedUserViews = try? JSONDecoder().decode(Int.self, from: userViewsData)
        else { return }
        self.userViews = receivedUserViews
    }

    // rateMe
    func showRateMe() {
        if !hasRated {
            if self.numberOfSearches % 3 == 0  {
                self.showRateMeView = true
            }
            if self.userViews % 3 == 0 {
                self.showRateMeView = true
            }
        }
    }


    // navigation
    func returnNavigationTitle() -> String {
        switch tabSelection {
        case 1: return "Main"
        case 2: return "Trends"
        case 3: return "Collections"
        default: return ""
        }
    }

}
