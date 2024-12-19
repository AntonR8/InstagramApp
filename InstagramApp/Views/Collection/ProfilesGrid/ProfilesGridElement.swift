//
//  GridElementView.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 12.09.2024.
//

import SwiftUI

struct ProfilesGridElement: View {
    @Bindable var profilesViewModel: ProfilesViewModel
    let folder: ProfileFolderModel
    let folderIndex: Int
    let icon: String
    let imageSize: CGFloat = UIScreen.main.bounds.width/2 - 32

    var body: some View {
        VStack(alignment: .leading) {
            NavigationLink(destination: {
                ProfilesFolderView(profilesViewModel: profilesViewModel, folder: folder, folderIndex: folderIndex)
            }, label: {
                if folder.name == "Recents" {
                    RecentsProfilesFolderLabel(profilesViewModel: profilesViewModel)
                } else {
                    ProfilesGridElementLabel(folder: folder)
                }
            })
            Label(folder.name, systemImage: icon)
        }

    }
}






#Preview {
    ProfilesGridElement(profilesViewModel: ProfilesViewModel(), folder: ProfileFolderModel(
        profilesArray: [ mockProfileResponse.data.profile ],
        name: "Saved"
    ), folderIndex: 0, icon: "heart")

}
