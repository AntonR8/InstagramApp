

import SwiftUI

struct ErrorSavingImageNotification: View {
    var profilesViewModel: ProfilesViewModel?
    var postsViewModel: PostsViewModel?

    var body: some View {
        CapsuleNotification(message: "Error, please try again", isErrorNotification: true)
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now()+3) {
                    if let profilesViewModel {
                        profilesViewModel.showErrorSavingImage = false
                    }
                    if let postsViewModel {
                        postsViewModel.showErrorSavingImage = false
                    }
                }
            }
    }
}

#Preview {
    ErrorSavingImageNotification(profilesViewModel: ProfilesViewModel())
}
