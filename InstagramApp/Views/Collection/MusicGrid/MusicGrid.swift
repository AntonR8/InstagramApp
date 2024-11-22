//
//  MusicGrid.swift
//  TikTokApp
//
//  Created by Антон Разгуляев on 17.10.2024.
//

import SwiftUI

struct MusicGrid: View {
    @Bindable var albumsViewModel: AlbumsViewModel

    var body: some View {
        LazyVGrid(columns: [GridItem(alignment: .top), GridItem(alignment: .top)], spacing: 16 ,content: {

            ForEach(Array(zip(albumsViewModel.music.indices, albumsViewModel.music)), id: \.0) { index, folder in
                MusicGridElement(albumsViewModel: albumsViewModel, folder: folder, folderIndex: index)
            }

            ForEach(albumsViewModel.savedPlaylists, id: \.self) { playlist in
                PlaylistGridElement(playlist: playlist)
            }

        })
        .onAppear {
            albumsViewModel.loadMusic()
            albumsViewModel.loadPlaylists()
        }
        .newMusicFolderAllert(albumsViewModel: albumsViewModel)
        .sheet(isPresented: $albumsViewModel.showSelectFolders) {
            SelectMusicFolder(albumsViewModel: albumsViewModel)
                .presentationDetents([.medium])
        }
    }
}

#Preview {
    MusicGrid(albumsViewModel: AlbumsViewModel())
}



