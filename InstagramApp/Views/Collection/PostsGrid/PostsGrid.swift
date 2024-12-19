//
//  GridView.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 12.09.2024.
//

import SwiftUI

struct PostsGrid: View {
    var postsViewModel: PostsViewModel

    var body: some View {
        LazyVGrid(columns: [GridItem(), GridItem()], spacing: 16,content: {
            ForEach(Array(zip(postsViewModel.posts.indices, postsViewModel.posts)), id: \.0) { index, folder in
                PostsGridElement(postsViewModel: postsViewModel, folder: folder, folderIndex: index, icon: postsViewModel.returnIcon(folderName: folder.name))
            }
        })
        .onAppear{
            postsViewModel.loadPosts()
        }
        .newPostFolderAllert(postsViewModel: postsViewModel)

    }
}

#Preview { 
    PostsGrid(postsViewModel: PostsViewModel())
}
