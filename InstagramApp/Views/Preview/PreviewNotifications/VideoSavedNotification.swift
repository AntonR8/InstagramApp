
import SwiftUI

struct VideoSavedNotification: View {
    @Environment(\.requestReview) var requestReview
    var mainViewModel: MainViewModel

    var body: some View {
        CapsuleNotification(message: "Video saved")
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now()+3) {
                    mainViewModel.showVideoSaved = false
                    requestReview()
                }
            }
    }
}

#Preview {
    VideoSavedNotification(mainViewModel: MainViewModel())
}
