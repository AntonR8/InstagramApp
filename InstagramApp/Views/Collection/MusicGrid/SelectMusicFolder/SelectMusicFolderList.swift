//
//  FolderList.swift
//  TikTokApp
//
//  Created by Антон Разгуляев on 18.10.2024.
//

import SwiftUI


struct SelectMusicFolderList: View {
    @Binding var selectedFolderIndex: Int?
    var albumsViewModel: AlbumsViewModel
    
    var body: some View {
        List {
            if !albumsViewModel.music.isEmpty {
                ForEach(Array(zip(albumsViewModel.music.indices, albumsViewModel.music)), id: \.0) { index, folder in
                    MusicListElement(folderIndex: index, folder: folder, albumsViewModel: albumsViewModel, selectedFolderIndex: $selectedFolderIndex)
                }
            }
        }
    }
}


#Preview {
    SelectMusicFolderList(selectedFolderIndex: .constant(0), albumsViewModel: AlbumsViewModel())
}
