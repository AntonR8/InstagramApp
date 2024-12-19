//
//  SelectVideoFolder.swift
//  SaveTik
//
//  Created by АнтохаПрограммист on 17.11.2024.
//

import SwiftUI

struct SelectPostsFolder: View {
    @State var selectedFolderIndex: Int?
    @Bindable var postsViewModel: PostsViewModel

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Select folder")
                    .font(.title3)
                    .bold()
                Spacer()
                SmallImageButton(leftIcon: "xmark", foregroundStyle: .white, action: {
                    postsViewModel.showSelectPostFolders = false
                })
            }
            .padding()
            SelectPostsFolderList(selectedFolderIndex: $selectedFolderIndex, postsViewModel: postsViewModel)
            HStack {
                CapsuleButton(leftIcon: "plus", title: "New folder", backgroundColor: .clear, foregroundColor: .accent) {
                    postsViewModel.showCreateNewFolderAllert = true
                }
                CapsuleButton(leftIcon: "checkmark", title: "Save") {
                    if let selectedFolderIndex {
                        postsViewModel.buttonSavePostInFolderAction(selectedFolderIndex: selectedFolderIndex)
                    }
                }
                .disabled(selectedFolderIndex == nil)
            }
            .padding()
        }
        .renamePostsFolderAllert(postsViewModel: postsViewModel)
    }
}

#Preview {
    SelectPostsFolder(postsViewModel: PostsViewModel())
}
