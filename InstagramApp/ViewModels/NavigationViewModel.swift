import SwiftUI
import Observation


@Observable
final class NavigationViewModel {
    var tabSelection = 1
    var showPaywall = false
    var launchScreenOpacity: Double = 1
    var albumViewIsShowing = false

    func returnNavigationTitle() -> String {
        switch tabSelection {
        case 1: return "Main"
        case 2: return "Trends"
        case 3: return "Collections"
        default: return ""
        }
    }
}
