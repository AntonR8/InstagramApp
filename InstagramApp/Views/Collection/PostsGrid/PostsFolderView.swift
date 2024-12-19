//
//  ImageView.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 26.09.2024.
//

import SwiftUI

struct PostsFolderView: View {
    @Bindable var postsViewModel: PostsViewModel
    @Environment(\.dismiss) var dismiss
    let folder: PostFolderModel
    let folderIndex: Int
    var folderClipsCount: Int { folder.postsArray.count }

    var navTitle: String? { nil }

    var body: some View {
        VStack(alignment: .leading) {
            Text("\(folderClipsCount) saved videos")
                .font(.footnote)
                .padding(.horizontal)
                .navigationTitle(navTitle ?? folder.name)
            if folder.postsArray.isEmpty {
                NoPostsView(folder: folder, action: dismiss)
            } else {
                ScrollView {
                    LazyVGrid(columns: [GridItem(spacing: 8), GridItem(spacing: 8)], spacing: 12,content: {
                        ForEach(Array(zip(folder.postsArray.indices, folder.postsArray)), id: \.0) { index, post in
                            PostsCover(postsViewModel: postsViewModel, post: post, folder: folder)
                        }
                    })
                }
                .padding(16)
            }
        }
        .onAppear(perform: {
            postsViewModel.showSelectPostFolders = false
        })
        .sheet(isPresented: $postsViewModel.showSelectPostFolders) {
            SelectPostsFolder(postsViewModel: postsViewModel)
                .presentationDetents([.medium])
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                if folder.name != "Saved" && folder.name != "Recents" {
                    EllipsisButton(
                        button1title: "Rename", button1icon: "pencil",
                        button1action: {
                            postsViewModel.renameFolderPressed(folderName: folder.name)
                        },
                        button2title: "Delete", button2icon: "trash",
                        button2action: {
                            postsViewModel.deleteFolder(folderIndex: folderIndex)
                            dismiss()
                        })
                }
            }
        }
        .renamePostsFolderAllert(postsViewModel: postsViewModel)
    }
}


#Preview {
    NavigationStack {
        PostsFolderView(postsViewModel: PostsViewModel(), folder: PostFolderModel(postsArray: [mockPostResponse.data.post], name: "Fuck"), folderIndex: 0)

    }
}
