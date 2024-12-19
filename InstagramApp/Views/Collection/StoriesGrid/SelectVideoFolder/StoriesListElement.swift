//
//  VideoListElement.swift
//  SaveTik
//
//  Created by Антон Разгуляев on 18.11.2024.
//

import SwiftUI

struct StoriesListElement: View {
    let folderIndex: Int
    var storiesViewModel: StoriesViewModel
    let folder: StoriesFolderModel
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
                    storiesViewModel.renameFolderPressed(folderName: folder.name)
                }, button2title: "Delete", button2icon: "trash") {
                    storiesViewModel.deleteFolder(folderIndex: folderIndex)
                }
            }
        }
    }
}

#Preview {
    StoriesListElement(folderIndex: 0, storiesViewModel: StoriesViewModel(), folder: StoriesFolderModel(storiesArray: [mockStoriesResponse.data.story], profileStoriesArray: [], name: ""), selectedFolderIndex: .constant(0))
}
