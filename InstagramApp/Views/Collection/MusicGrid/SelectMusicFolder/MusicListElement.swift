//
//  ListElement.swift
//  TikTokApp
//
//  Created by Антон Разгуляев on 18.10.2024.
//

import SwiftUI

struct MusicListElement: View {
    let folderIndex: Int
    let folder: MusicFolderModel
    var albumsViewModel: AlbumsViewModel
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
                    albumsViewModel.renameFolderPressed(folderName: folder.name)
                }, button2title: "Delete", button2icon: "trash") {
                    albumsViewModel.deleteFolder(folderIndex: folderIndex)
                }
            }
        }

    }
}

#Preview {
    MusicListElement(folderIndex: 0, folder: MusicFolderModel(tracks: [], name: "Saved"), albumsViewModel: AlbumsViewModel(), selectedFolderIndex: .constant(0))
}
