//
//  GridView.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 12.09.2024.
//

import SwiftUI

struct ProfilesGrid: View {
    var profilesViewModel: ProfilesViewModel

    var body: some View {
        LazyVGrid(columns: [GridItem(), GridItem()], spacing: 16,content: {
            ForEach(Array(zip(profilesViewModel.profiles.indices, profilesViewModel.profiles)), id: \.0) { index, folder in
                ProfilesGridElement(profilesViewModel: profilesViewModel, folder: folder, folderIndex: index, icon: profilesViewModel.returnIcon(folderName: folder.name))
            }
        })
        .onAppear{
            profilesViewModel.loadProfiles()
        }
        .newProfileFolderAllert(profilesViewModel: profilesViewModel)

    }
}

#Preview { 
    ProfilesGrid(profilesViewModel: ProfilesViewModel())
}
