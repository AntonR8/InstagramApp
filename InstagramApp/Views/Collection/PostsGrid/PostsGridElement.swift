//
//  GridElementView.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 12.09.2024.
//

import SwiftUI

struct PostsGridElement: View {
    @Bindable var postsViewModel: PostsViewModel
    let folder: PostFolderModel
    let folderIndex: Int
    let icon: String
    let imageSize: CGFloat = UIScreen.main.bounds.width/2 - 32

    var body: some View {
        VStack(alignment: .leading) {
            NavigationLink(destination: {
                PostsFolderView(postsViewModel: postsViewModel, folder: folder, folderIndex: folderIndex)
            }, label: {
                if folder.name == "Recents" {
                    RecentsPostsFolderLabel(postsViewModel: postsViewModel)
                } else {
                    PostsGridElementLabel(folder: folder)
                }
            })
            Label(folder.name, systemImage: icon)
        }

    }
}






#Preview {
    PostsGridElement(postsViewModel: PostsViewModel(), folder: PostFolderModel(
        postsArray: [ mockPostResponse.data.post ],
        name: "Saved"
    ), folderIndex: 0, icon: "heart")

}
