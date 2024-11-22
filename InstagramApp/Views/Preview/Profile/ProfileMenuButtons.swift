//
//  ProfileMenuButtons.swift
//  InstagramApp
//
//  Created by Антон Разгуляев on 22.11.2024.
//

import SwiftUI

struct ProfileMenuButtons: View {
    let link: String

    var body: some View {
        HStack(alignment: .top) {
            if let url = URL(string: link) {
                ShareLink(item: url) {
                    MenuElement(icon: "square.and.arrow.up", title: "Share")
                }
            }

            Button {
//                if mainViewModel.clipInfo != nil {
//                    videosViewModel.clipForAdd = mainViewModel.clipInfo
//                    videosViewModel.showSelectVideoFolders = true
//                } else { print("clipInfo ПУСТОЙ") }
            } label: { MenuElement(icon: "bookmark", title: "Add to collection...") }

            Button {
//                UIPasteboard.general.string = info.musicTitle
//                mainViewModel.showTrackNameCopied = true
            } label: { MenuElement(icon: "doc.on.doc", title: "Copy profile text") }
        }
        .foregroundStyle(.primary)
    }
}

#Preview {
    ProfileMenuButtons(link: "https://www.youtube.com/watch?v=")
}
