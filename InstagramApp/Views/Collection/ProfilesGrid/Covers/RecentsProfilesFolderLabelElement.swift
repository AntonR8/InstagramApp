//
//  RecentsFolderLabelElement.swift
//  SaveTik
//
//  Created by Антон Разгуляев on 18.11.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct RecentsProfilesFolderLabelElement: View {
    let folderSize: CGFloat
    let number: Int
    let recentsFolderCount: Int
    let recentsFourProfiles: [ProfileModel]

    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(Color.gray.opacity(0.1))
            .frame(width: folderSize/2-16, height: folderSize/2-16)
            .overlay {
                if recentsFolderCount > number {
                    if let currentURL = URL(string: recentsFourProfiles[number].avatar) {
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
    RecentsProfilesFolderLabelElement(
        folderSize: UIScreen.main.bounds.width/2 - 24,
        number: 0,
        recentsFolderCount: 1,
        recentsFourProfiles: [mockProfileResponse.data.profile]
    )
}
