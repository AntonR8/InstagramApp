//
//  VideoListElement.swift
//  SaveTik
//
//  Created by Антон Разгуляев on 18.11.2024.
//

import SwiftUI

struct VideoListElement: View {
    let folderIndex: Int
    var reelsViewModel: ReelsViewModel
    let folder: ReelsFolderModel
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
                    reelsViewModel.renameFolderPressed(folderName: folder.name)
                }, button2title: "Delete", button2icon: "trash") {
                    reelsViewModel.deleteFolder(folderIndex: folderIndex)
                }
            }
        }
    }
}

#Preview {
    VideoListElement(folderIndex: 0, reelsViewModel: ReelsViewModel(), folder: ReelsFolderModel(reelsArray: [mockReelsResponse.data.reels], name: ""), selectedFolderIndex: .constant(0))
}
