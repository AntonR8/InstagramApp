//
//  ImageView.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 26.09.2024.
//

import SwiftUI

struct StoriesFolderView: View {
    @Bindable  var storiesViewModel: StoriesViewModel
    @Environment(\.dismiss) var dismiss
    let folder: StoriesFolderModel
    let folderIndex: Int
    var folderClipsCount: Int { folder.storiesArray.count }

    var navTitle: String? { nil }

    var body: some View {
        VStack(alignment: .leading) {
            Text("\(folderClipsCount) saved videos")
                .font(.footnote)
                .padding(.horizontal)
                .navigationTitle(navTitle ?? folder.name)
            if folder.storiesArray.isEmpty {
                NoStoriesView(folder: folder, action: dismiss)
            } else {
                ScrollView {
                    LazyVGrid(columns: [GridItem(spacing: 8), GridItem(spacing: 8)], spacing: 12,content: {
                        ForEach(Array(zip(folder.storiesArray.indices, folder.storiesArray)), id: \.0) { index, stories in
                            StoriesCover(storiesViewModel: storiesViewModel, stories: stories, folder: folder)
                        }
                    })
                }
                .padding(16)
            }
        }
        .onAppear(perform: {
            storiesViewModel.showSelectStoriesFolders = false
        })
        .sheet(isPresented: $storiesViewModel.showSelectStoriesFolders) {
            SelectStoriesFolder(storiesViewModel: storiesViewModel)
                .presentationDetents([.medium])
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                if folder.name != "Saved" && folder.name != "Recents" {
                    EllipsisButton(
                        button1title: "Rename", button1icon: "pencil",
                        button1action: {
                            storiesViewModel.renameFolderPressed(folderName: folder.name)
                        },
                        button2title: "Delete", button2icon: "trash",
                        button2action: {
                            storiesViewModel.deleteFolder(folderIndex: folderIndex)
                            dismiss()
                        })
                }
            }
        }
        .renameStoriesFolderAllert(storiesViewModel: storiesViewModel)
    }
}


#Preview {
    NavigationStack {
        StoriesFolderView(
            storiesViewModel: StoriesViewModel(),
            folder: StoriesFolderModel(
                storiesArray: [mockStoriesResponse.data.story],
                profileStoriesArray: [],
                name: "Fuck"
            ),
            folderIndex: 0
        )

    }
}
