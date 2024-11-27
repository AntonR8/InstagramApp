//
//  GridElementView.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 12.09.2024.
//

import SwiftUI

struct VideoGridElement: View {
    @Bindable var reelsViewModel: ReelsViewModel
    let folder: ReelsFolderModel
    let folderIndex: Int
    let icon: String
    let imageSize: CGFloat = UIScreen.main.bounds.width/2 - 32

    var body: some View {
        VStack(alignment: .leading) {
            NavigationLink(destination: {
                VideoFolderView(reelsViewModel: reelsViewModel, folder: folder, folderIndex: folderIndex)
            }, label: {
                if folder.name == "Recents" {
                    RecentsFolderLabel(reelsViewModel: reelsViewModel)
                } else {
                    VideoGridElementLabel(folder: folder)
                }
            })
            Label(folder.name, systemImage: icon)
        }

    }
}






#Preview {
    VideoGridElement(reelsViewModel: ReelsViewModel(), folder: ReelsFolderModel(
        reelsArray: [ mockReelsResponse.data.reels ],
        name: "Saved"
    ), folderIndex: 0, icon: "heart")

}
