//
//  VideoCover.swift
//  TikTokApp
//
//  Created by Антон Разгуляев on 17.10.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct VideoCover: View {
    var reelsViewModel: ReelsViewModel
    let reels: ReelsModel
    let folder: ReelsFolderModel

    var body: some View {
        RoundedRectangle(cornerRadius: 16)
            .fill(Color.gray.opacity(0.2))
            .frame(width: UIScreen.main.bounds.width/2 - 24, height: (UIScreen.main.bounds.width/2 - 24)/9*16)
            .overlay {
                if let imageVideoPreview = folder.reelsArray.last?.authorAvatar {
                    WebImage(url: URL(string: reels.authorAvatar)) { image in
                        image.resizable()
                    } placeholder: {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.gray.opacity(0.1))
                            .frame(width: UIScreen.main.bounds.width/2 - 24, height: (UIScreen.main.bounds.width/2 - 24)/9*16)
                    }
                    .indicator(.activity)
                    .scaledToFit()
                    .cornerRadius(16)
                }
            }
            .overlay(alignment: .topTrailing) {
                EllipsisButton(
                    background: .black.opacity(0.3),
                    foregroundStyle: .white,
                    reelsfolder: folder,
                    reels: reels,
                    button1title: "Add...", button1icon: "bookmark",
                    button1action: {
                        reelsViewModel.showSelectVideoFolders = true
                        reelsViewModel.reelsForAdd = reels
                    },
                    button2title: "Remove", button2icon: "trash",
                    button2action: {
                        reelsViewModel.removeClip(from: folder.name, reels: reels)
                    })
                .padding(8)
            }
    }
}

#Preview {
    NavigationStack {
        VideoCover(reelsViewModel: ReelsViewModel(), reels: mockReelsResponse.data.reels, folder: ReelsFolderModel(
            reelsArray: [mockReelsResponse.data.reels],
            name: "Saved"
        ))
    }
}
