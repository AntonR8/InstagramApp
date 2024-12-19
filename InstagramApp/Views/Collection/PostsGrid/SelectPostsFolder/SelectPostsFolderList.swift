//
//  SelectVideoFolderList.swift
//  SaveTik
//
//  Created by АнтохаПрограммист on 17.11.2024.
//

import SwiftUI

struct SelectPostsFolderList: View {
    @Binding var selectedFolderIndex: Int?
    var postsViewModel: PostsViewModel

    var body: some View {
        List {
            if !postsViewModel.posts.isEmpty {
                ForEach(Array(zip(postsViewModel.posts.indices, postsViewModel.posts)), id: \.0) { index, folder in
                    if folder.name != "Recents" {
                        PostsListElement(folderIndex: index, postsViewModel: postsViewModel, folder: folder, selectedFolderIndex: $selectedFolderIndex)
                            .listRowBackground(Color.gray.opacity(0.2))
                    }
                }
            }
        }
        .background(.white)
        .scrollContentBackground(.hidden)
    }
}

#Preview {
    SelectPostsFolderList(selectedFolderIndex: .constant(0), postsViewModel: PostsViewModel())
}
