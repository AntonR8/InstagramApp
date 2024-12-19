
import SwiftUI

struct ImagesSavedNotification: View {
    var postsViewModel: PostsViewModel

    var body: some View {
        CapsuleNotification(message: "Images saved")
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now()+3) {
                    postsViewModel.showImageSaved = false
                }
            }
    }
}

#Preview {
    ImagesSavedNotification(postsViewModel: PostsViewModel())
}
