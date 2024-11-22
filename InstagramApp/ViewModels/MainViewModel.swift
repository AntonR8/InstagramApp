import SwiftUI
import Observation


@Observable
final class MainViewModel {
    var path = NavigationPath()
    var showWrongLinkAlert = false
    var showDownloading = false

    // Preview
    var showRateMeView = false

    // notifications:
    var showTrackNameCopied = false
    var showSavingAudio = false
    var showAudioSavedToFiles = false
    var showErrorSavingAudio = false
    var showProgressViewWhileSaving = false
    var showVideoSaved = false
    var showVideoNOTSaved = false




}
