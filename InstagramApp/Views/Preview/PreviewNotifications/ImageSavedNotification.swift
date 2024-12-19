
import SwiftUI

struct ImageSavedNotification: View {
    var profilesViewModel: ProfilesViewModel?
    var postsViewModel: PostsViewModel?

    var body: some View {
        CapsuleNotification(message: "Image saved")
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now()+3) {
                    if let profilesViewModel {
                        profilesViewModel.showImageSaved = false
                    }
                    if let postsViewModel {
                        postsViewModel.showImageSaved = false
                    }
                }
            }
    }
}

#Preview {
    ImageSavedNotification(profilesViewModel: ProfilesViewModel())
}
