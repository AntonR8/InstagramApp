//
//  GridElementView.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 12.09.2024.
//

import SwiftUI

struct StoriesGridElement: View {
    @Bindable  var storiesViewModel: StoriesViewModel
    let folder: StoriesFolderModel
    let folderIndex: Int
    let icon: String
    let imageSize: CGFloat = UIScreen.main.bounds.width/2 - 32

    var body: some View {
        VStack(alignment: .leading) {
            NavigationLink(destination: {
                StoriesFolderView(storiesViewModel: storiesViewModel, folder: folder, folderIndex: folderIndex)
            }, label: {
                if folder.name == "Recents" {
                    RecentsStoriesFolderLabel(storiesViewModel: storiesViewModel)
                } else {
                    StoriesGridElementLabel(folder: folder)
                }
            })
            Label(folder.name, systemImage: icon)
        }

    }
}






#Preview {
    StoriesGridElement(storiesViewModel: StoriesViewModel(), folder: StoriesFolderModel(
        storiesArray: [ mockStoriesResponse.data.story ], profileStoriesArray: [],
        name: "Saved"
    ), folderIndex: 0, icon: "heart")

}
