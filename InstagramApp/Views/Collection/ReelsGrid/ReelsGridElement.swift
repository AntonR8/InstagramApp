//
//  GridElementView.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 12.09.2024.
//

import SwiftUI

struct ReelsGridElement: View {
    @Bindable var reelsViewModel: ReelsViewModel
    let folder: ReelsFolderModel
    let folderIndex: Int
    let icon: String
    let imageSize: CGFloat = UIScreen.main.bounds.width/2 - 32

    var body: some View {
        VStack(alignment: .leading) {
            NavigationLink(destination: {
                ReelsFolderView(reelsViewModel: reelsViewModel, folder: folder, folderIndex: folderIndex)
            }, label: {
                if folder.name == "Recents" {
                    ReelsRecentsFolderLabel(reelsViewModel: reelsViewModel)
                } else {
                    ReelsGridElementLabel(folder: folder)
                }
            })
            Label(folder.name, systemImage: icon)
        }

    }
}






#Preview {
    ReelsGridElement(reelsViewModel: ReelsViewModel(), folder: ReelsFolderModel(
        reelsArray: [ mockReelsResponse.data.reels ],
        name: "Saved"
    ), folderIndex: 0, icon: "heart")

}
