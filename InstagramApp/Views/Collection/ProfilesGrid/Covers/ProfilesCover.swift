
import SwiftUI
import SDWebImageSwiftUI

struct ProfilesCover: View {
    var profilesViewModel: ProfilesViewModel
    let profile: ProfileModel
    let folder: ProfileFolderModel
    let folderSize = UIScreen.main.bounds.width/2 - 24

    var body: some View {
        NavigationLink {
            ProfilePreview(profile: profile)
        } label: {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.gray.opacity(0.2))
                .frame(width: folderSize, height: folderSize)
                .overlay {
                    WebImage(url: URL(string: profile.avatar)) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: folderSize, height: folderSize)
                    } placeholder: {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.gray.opacity(0.1))
                            .frame(width: folderSize, height: folderSize)
                    }
                    .indicator(.activity)
                    .clipped()
                    .cornerRadius(16)
                }
                .overlay(alignment: .topTrailing) {
                    EllipsisButton(
                        background: .black.opacity(0.3),
                        foregroundStyle: .white,
                        button1title: "Add...", button1icon: "bookmark",
                        button1action: {
                            profilesViewModel.showSelectProfileFolders = true
                            profilesViewModel.profileForAdd = profile
                        },
                        button2title: "Remove", button2icon: "trash",
                        button2action: {
                            profilesViewModel.removeProfile(from: folder.name, profile: profile)
                        })
                    .padding(8)
                }
        }
    }
}

#Preview {
    NavigationStack {
        ProfilesCover(profilesViewModel: ProfilesViewModel(), profile: mockProfileResponse.data.profile, folder: ProfileFolderModel(
            profilesArray: [mockProfileResponse.data.profile],
            name: "Saved"
        ))
    }
}
