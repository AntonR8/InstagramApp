//
//  VideoListElement.swift
//  SaveTik
//
//  Created by Антон Разгуляев on 18.11.2024.
//

import SwiftUI

struct PostsListElement: View {
    let folderIndex: Int
    var postsViewModel: PostsViewModel
    let folder: PostFolderModel
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
                    postsViewModel.renameFolderPressed(folderName: folder.name)
                }, button2title: "Delete", button2icon: "trash") {
                    postsViewModel.deleteFolder(folderIndex: folderIndex)
                }
            }
        }
    }
}

#Preview {
    PostsListElement(folderIndex: 0, postsViewModel: PostsViewModel(), folder: PostFolderModel(postsArray: [mockPostResponse.data.post], name: ""), selectedFolderIndex: .constant(0))
}
