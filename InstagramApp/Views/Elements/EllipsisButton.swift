//
//  EllipsisButton.swift
//  TikTokApp
//
//  Created by Антон Разгуляев on 30.10.2024.
//

import SwiftUI

struct EllipsisButton: View {
    var background: Color?
    var foregroundStyle: Color?

    var musicfolder: MusicFolderModel?
    var videofolder: VideoFolderModel?
    var clip: ClipInfoModel?

    let button1title: String
    let button1icon: String
    let button1action: () -> Void

    let button2title: String
    let button2icon: String
    let button2action: () -> Void

    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(background ?? .black.opacity(0.001))
            .frame(width: 32, height: 32)
            .overlay {
                Image(systemName: "ellipsis")
                    .foregroundStyle(foregroundStyle ?? .accent)
            }
            .contextMenu(menuItems: {
                Button(button1title, systemImage: button1icon) {
                    button1action()
                }
                Divider()
                Button(button2title, systemImage: button2icon, role: .destructive, action: {
                    button2action()
                } )
            })
    }
}

#Preview {
    ZStack {
        Color.green.ignoresSafeArea()
        VStack {
            EllipsisButton(
                musicfolder: MusicFolderModel(tracks: [], name: "Test"),
                button1title: "Add...",
                button1icon: "bookmark",
                button1action: {
                    //                    vm.showSelectFolders = true
                    //                    videosManager.clipForAdd = clip
                },
                button2title: "Remove",
                button2icon: "trash",
                button2action: {
                    //                    videosManager.removeClip(from: folderName, clip: clip)
                })
            Text("")
            Image(systemName: "ellipsis")
                .foregroundStyle(.accent)
                .frame(minWidth: 0)
                .contextMenu(menuItems: {
    //               
                })
        }
    }

}
