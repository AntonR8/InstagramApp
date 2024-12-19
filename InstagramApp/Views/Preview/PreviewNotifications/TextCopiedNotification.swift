
import SwiftUI

struct TextCopiedNotification: View {
    var profilesViewModel: ProfilesViewModel?
    var postsViewModel: PostsViewModel?
    var body: some View {
        CapsuleNotification(message: "Text copied")
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now()+3) {
                    if let profilesViewModel{
                        profilesViewModel.showTextCopied = false
                    }
                    if let postsViewModel{
                        postsViewModel.showTextCopied = false
                    }
                }
            }
    }
}

#Preview {
    TextCopiedNotification(profilesViewModel: ProfilesViewModel())
}
