//
//  VideoListElement.swift
//  SaveTik
//
//  Created by Антон Разгуляев on 18.11.2024.
//

import SwiftUI

struct VideoListElement: View {
    let folderIndex: Int
    var videosViewModel: VideosViewModel
    let folder: VideoFolderModel
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
                    videosViewModel.renameFolderPressed(folderName: folder.name)
                }, button2title: "Delete", button2icon: "trash") {
                    videosViewModel.deleteFolder(folderIndex: folderIndex)
                }
            }
        }
    }
}

#Preview {
    VideoListElement(folderIndex: 0, videosViewModel: VideosViewModel(), folder: VideoFolderModel(clips: [], name: ""), selectedFolderIndex: .constant(0))
}
