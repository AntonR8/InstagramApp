//
//  ImageView.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 26.09.2024.
//

import SwiftUI

struct ProfilesFolderView: View {
    @Bindable var profilesViewModel: ProfilesViewModel
    @Environment(\.dismiss) var dismiss
    let folder: ProfileFolderModel
    let folderIndex: Int
    var folderClipsCount: Int { folder.profilesArray.count }

    var navTitle: String? { nil }

    var body: some View {
        VStack(alignment: .leading) {
            Text("\(folderClipsCount) saved videos")
                .font(.footnote)
                .padding(.horizontal)
                .navigationTitle(navTitle ?? folder.name)
            if folder.profilesArray.isEmpty {
                NoProfilesView(folder: folder, action: dismiss)
            } else {
                ScrollView {
                    LazyVGrid(columns: [GridItem(spacing: 8), GridItem(spacing: 8)], spacing: 12,content: {
                        ForEach(Array(zip(folder.profilesArray.indices, folder.profilesArray)), id: \.0) { index, profile in
                            ProfilesCover(profilesViewModel: profilesViewModel, profile: profile, folder: folder)
                        }
                    })
                }
                .padding(16)
            }
        }
        .onAppear(perform: {
            profilesViewModel.showSelectProfileFolders = false
        })
        .sheet(isPresented: $profilesViewModel.showSelectProfileFolders) {
            SelectProfilesFolder(profilesViewModel: profilesViewModel)
                .presentationDetents([.medium])
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                if folder.name != "Saved" && folder.name != "Recents" {
                    EllipsisButton(
                        button1title: "Rename", button1icon: "pencil",
                        button1action: {
                            profilesViewModel.renameFolderPressed(folderName: folder.name)
                        },
                        button2title: "Delete", button2icon: "trash",
                        button2action: {
                            profilesViewModel.deleteFolder(folderIndex: folderIndex)
                            dismiss()
                        })
                }
            }
        }
        .renameProfileFolderAllert(profilesViewModel: profilesViewModel)
    }
}


#Preview {
    NavigationStack {
        ProfilesFolderView(profilesViewModel: ProfilesViewModel(), folder: ProfileFolderModel(profilesArray: [mockProfileResponse.data.profile], name: "Fuck"), folderIndex: 0)

    }
}
