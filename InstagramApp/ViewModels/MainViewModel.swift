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
    var showProgressWhileSavingVideo = false
    var showVideoSaved = false
    var showVideoNOTSaved = false
    var showTextCopied = false
    var showProgressWhileSavingImage = false
    var showImageSaved = false
    var showErrorSavingImage = false
    var showProgressWhileSavingStories = false
    var showStoriesSaved = false

    //downloads:
    var reelsData: ReelsModel?
    var postData: PostModel?


}
