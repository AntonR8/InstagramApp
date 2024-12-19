
import SwiftUI

struct SelectProfilesFolder: View {
    @State var selectedFolderIndex: Int?
    @Bindable var profilesViewModel: ProfilesViewModel

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Select folder")
                    .font(.title3)
                    .bold()
                Spacer()
                SmallImageButton(leftIcon: "xmark", foregroundStyle: .white, action: {
                    profilesViewModel.showSelectProfileFolders = false
                })
            }
            .padding()
            SelectProfilesFolderList(selectedFolderIndex: $selectedFolderIndex, profilesViewModel: profilesViewModel)
            HStack {
                CapsuleButton(leftIcon: "plus", title: "New folder", backgroundColor: .clear, foregroundColor: .accent) {
                    profilesViewModel.showCreateNewFolderAllert = true
                }
                CapsuleButton(leftIcon: "checkmark", title: "Save") {
                    if let selectedFolderIndex {
                        profilesViewModel.buttonSaveProfileInFolderAction(selectedFolderIndex: selectedFolderIndex)
                    }
                }
                .disabled(selectedFolderIndex == nil)
            }
            .padding()
        }
        .renameProfileFolderAllert(profilesViewModel: profilesViewModel)
    }
}

#Preview {
    SelectProfilesFolder(profilesViewModel: ProfilesViewModel())
}
