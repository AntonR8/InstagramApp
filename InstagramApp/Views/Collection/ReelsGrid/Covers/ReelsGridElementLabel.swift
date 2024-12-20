//
//  GridElementView.swift
//  TikTokApp
//
//  Created by Антон Разгуляев on 17.10.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct ReelsGridElementLabel: View {
    let folderSize: CGFloat = UIScreen.main.bounds.width/2 - 24
    let imagecornerRadius: CGFloat = 16
    var folder: ReelsFolderModel

    var body: some View {

        RoundedRectangle(cornerRadius: 20)
            .fill(Color.gray.opacity(0.2))
            .frame(width: folderSize, height: folderSize)
            .overlay {
                if let imageVideoPreview = folder.reelsArray.last?.imagePreview {
                    WebImage(url: URL(string: imageVideoPreview)) { image in
                        image.resizable()
                    } placeholder: {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.gray.opacity(0.1))
                            .frame(width: folderSize, height: folderSize)
                    }

                    .indicator(.activity)
                    .scaledToFill()
                    .frame(width: folderSize, height: folderSize)
                    .cornerRadius(12)
                }
            }
    }
}

#Preview {
    ReelsGridElementLabel(
        folder: ReelsFolderModel(
            reelsArray: [mockReelsResponse.data.reels],
            name: "Saved"
        )
    )

}
