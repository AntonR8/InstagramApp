//
//  ImageView.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 26.09.2024.
//

import SwiftUI

struct ReelsFolderView: View {
    @Bindable var reelsViewModel: ReelsViewModel
    @Environment(\.dismiss) var dismiss
    let folder: ReelsFolderModel
    let folderIndex: Int
    var folderClipsCount: Int { folder.reelsArray.count }

    var navTitle: String? { nil }

    var body: some View {
        VStack(alignment: .leading) {
            Text("\(folderClipsCount) saved videos")
                .font(.footnote)
                .padding(.horizontal)
                .navigationTitle(navTitle ?? folder.name)
            if folder.reelsArray.isEmpty {
                NoReelsView(folder: folder, action: dismiss)
            } else {
                ScrollView {
                    LazyVGrid(columns: [GridItem(spacing: 8), GridItem(spacing: 8)], spacing: 12,content: {
                        ForEach(Array(zip(folder.reelsArray.indices, folder.reelsArray)), id: \.0) { index, reels in
                            ReelsCover(reelsViewModel: reelsViewModel, reels: reels, folder: folder)
                        }
                    })
                }
                .padding(16)
            }
        }
        .onAppear(perform: {
            reelsViewModel.showSelectVideoFolders = false
        })
        .sheet(isPresented: $reelsViewModel.showSelectVideoFolders) {
            SelectReelsFolder(reelsViewModel: reelsViewModel)
                .presentationDetents([.medium])
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                if folder.name != "Saved" && folder.name != "Recents" {
                    EllipsisButton(
                        button1title: "Rename", button1icon: "pencil",
                        button1action: {
                            reelsViewModel.renameFolderPressed(folderName: folder.name)
                        },
                        button2title: "Delete", button2icon: "trash",
                        button2action: {
                            reelsViewModel.deleteFolder(folderIndex: folderIndex)
                            dismiss()
                        })
                }
            }
        }
        .renameReelsFolderAllert(reelsViewModel: reelsViewModel)
    }
}


#Preview {
    NavigationStack {
        ReelsFolderView(reelsViewModel: ReelsViewModel(), folder: ReelsFolderModel(reelsArray: [mockReelsResponse.data.reels], name: "Fuck"), folderIndex: 0)

    }
}
