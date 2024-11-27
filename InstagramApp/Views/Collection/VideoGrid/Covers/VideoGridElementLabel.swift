//
//  GridElementView.swift
//  TikTokApp
//
//  Created by Антон Разгуляев on 17.10.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct VideoGridElementLabel: View {
    let folderSize: CGFloat = UIScreen.main.bounds.width/2 - 24
    let imagecornerRadius: CGFloat = 16
    var folder: ReelsFolderModel

    var body: some View {

        RoundedRectangle(cornerRadius: 20)
            .fill(Color.gray.opacity(0.2))
            .frame(width: folderSize, height: folderSize)
            .overlay {
                if let imageVideoPreview = folder.reelsArray.last?.authorAvatar {
                    WebImage(url: URL(string: imageVideoPreview)) { image in
                        image.resizable()
                    } placeholder: {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.gray.opacity(0.1))
                            .frame(width: folderSize-24, height: folderSize-24)
                    }

                    .indicator(.activity)
                    .scaledToFill()
                    .frame(width: folderSize-24, height: folderSize-24)
                    .cornerRadius(12)
                }
            }
    }
}

#Preview {
    VideoGridElementLabel(
        folder: ReelsFolderModel(
            reelsArray: [mockReelsResponse.data.reels],
            name: "Saved"
        )
    )

}
