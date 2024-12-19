//
//  VideoListElement.swift
//  SaveTik
//
//  Created by Антон Разгуляев on 18.11.2024.
//

import SwiftUI

struct ProfilesListElement: View {
    let folderIndex: Int
    var profilesViewModel: ProfilesViewModel
    let folder: ProfileFolderModel
    @Binding var selectedFolderIndex: Int?
    @State var folderIsChoosen: Bool = false

    var body: some View {
        HStack {
            CircleButton(isChosen: $folderIsChoosen, action: {
                if folderIsChoosen {
                    selectedFolderIndex = folderIndex
                }
            })
            Image(systemName: "bookmark")
                .foregroundStyle(.accent)
            Text(folder.name)
            Spacer()
            if folder.name != "Saved" {
                EllipsisButton(button1title: "Rename", button1icon: "pencil", button1action: {
                    profilesViewModel.renameFolderPressed(folderName: folder.name)
                }, button2title: "Delete", button2icon: "trash") {
                    profilesViewModel.deleteFolder(folderIndex: folderIndex)
                }
            }
        }
    }
}

#Preview {
    ProfilesListElement(folderIndex: 0, profilesViewModel: ProfilesViewModel(), folder: ProfileFolderModel(profilesArray: [mockProfileResponse.data.profile], name: ""), selectedFolderIndex: .constant(0))
}
