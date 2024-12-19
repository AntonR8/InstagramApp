//
//  RecentsFolderLabelElement.swift
//  SaveTik
//
//  Created by Антон Разгуляев on 18.11.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct RecentsPostsFolderLabelElement: View {
    let folderSize: CGFloat
    let number: Int
    let recentsFolderCount: Int
    let recentsFourclips: [PostModel]

    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(Color.gray.opacity(0.1))
            .frame(width: folderSize/2-16, height: folderSize/2-16)
            .overlay {
                if recentsFolderCount > number {
                    if let currentURL = URL(string: recentsFourclips[number].imageDownloadUrl ?? "") {
                        WebImage(url: currentURL) { image in
                            image.resizable()
                        } placeholder: { Rectangle().foregroundColor(.gray) }
                            .indicator(.activity)
                            .scaledToFill()
                            .frame(width: folderSize/2-16, height: folderSize/2-16)
                            .cornerRadius(8)
                    }
                }
            }
    }
}

#Preview {
    RecentsPostsFolderLabelElement(
        folderSize: UIScreen.main.bounds.width/2 - 24,
        number: 0,
        recentsFolderCount: 1,
        recentsFourclips: [mockPostResponse.data.post]
    )
}
