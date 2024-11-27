//
//  PostMenuButtons.swift
//  InstagramApp
//
//  Created by Антон Разгуляев on 22.11.2024.
//

import SwiftUI

struct PostMenuButtons: View {
    let post: PostModel
    var mainViewModel: MainViewModel

    var body: some View {
        HStack(alignment: .top) {
            if let url = URL(string: post.imageDownloadUrl ?? "") {
                ShareLink(item: url) {
                    MenuElement(icon: "square.and.arrow.up", title: "Share")
                }
            }

            Button {
                if mainViewModel.postData != nil {
//                    videosViewModel.clipForAdd = mainViewModel.clipInfo
//                    videosViewModel.showSelectVideoFolders = true
                } else { print("postData пустая") }
            } label: { MenuElement(icon: "bookmark", title: "Add to collection...") }

            Button {
                UIPasteboard.general.string = post.description
                mainViewModel.showTrackNameCopied = true
            } label: { MenuElement(icon: "doc.on.doc", title: "Copy post text") }
        }
        .foregroundStyle(.primary)
    }
}

#Preview {
    PostMenuButtons(post: mockPostResponse.data.post, mainViewModel: MainViewModel())
}
