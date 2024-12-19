//
//  SelectVideoFolderList.swift
//  SaveTik
//
//  Created by АнтохаПрограммист on 17.11.2024.
//

import SwiftUI

struct SelectProfilesFolderList: View {
    @Binding var selectedFolderIndex: Int?
    var profilesViewModel: ProfilesViewModel

    var body: some View {
        List {
            if !profilesViewModel.profiles.isEmpty {
                ForEach(Array(zip(profilesViewModel.profiles.indices, profilesViewModel.profiles)), id: \.0) { index, folder in
                    if folder.name != "Recents" {
                        ProfilesListElement(folderIndex: index, profilesViewModel: profilesViewModel, folder: folder, selectedFolderIndex: $selectedFolderIndex)
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
    SelectProfilesFolderList(selectedFolderIndex: .constant(0), profilesViewModel: ProfilesViewModel())
}
