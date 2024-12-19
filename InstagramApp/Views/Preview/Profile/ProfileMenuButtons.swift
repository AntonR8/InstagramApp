
import SwiftUI

struct ProfileMenuButtons: View {
    var profilesViewModel: ProfilesViewModel
    let profile: ProfileModel
    let link: String

    var body: some View {
        HStack(alignment: .top) {
            if let url = URL(string: link) {
                ShareLink(item: url) {
                    MenuElement(icon: "square.and.arrow.up", title: "Share")
                }
            }

            Button {
                    profilesViewModel.profileForAdd = profile
                    profilesViewModel.showSelectProfileFolders = true
            } label: { MenuElement(icon: "bookmark", title: "Add to collection...") }

            Button {
                UIPasteboard.general.string = profile.description
                profilesViewModel.showTextCopied = true
            } label: { MenuElement(icon: "doc.on.doc", title: "Copy profile text") }
        }
        .foregroundStyle(.primary)
    }
}

#Preview {
    ProfileMenuButtons(profilesViewModel: ProfilesViewModel(), profile: mockProfileResponse.data.profile, link: "")
}
