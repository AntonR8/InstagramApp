
import SwiftUI

struct VideoSavedNotification: View {
    @Environment(\.requestReview) var requestReview
    var reelsViewModel: ReelsViewModel

    var body: some View {
        CapsuleNotification(message: "Video saved")
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now()+3) {
                    reelsViewModel.showVideoSaved = false
                    requestReview()
                }
            }
    }
}

#Preview {
    VideoSavedNotification(reelsViewModel: ReelsViewModel())
}
