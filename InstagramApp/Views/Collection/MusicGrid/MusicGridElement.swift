//
//  MusicGridElement.swift
//  TikTokApp
//
//  Created by Антон Разгуляев on 01.11.2024.
//

import SwiftUI

struct MusicGridElement: View {
    var albumsViewModel: AlbumsViewModel
    let folder: MusicFolderModel
    let folderIndex: Int
    let imageSize: CGFloat = UIScreen.main.bounds.width/2 - 32

    var body: some View {
        VStack(alignment: .leading) {
            NavigationLink(destination: {
                MusicFolderView(albumsViewModel: albumsViewModel, audioPlayerViewModel: AudioPlayerViewModel(playlist: folder.tracks), folder: folder, folderIndex: folderIndex)
            }, label: {
                SavedFolderCover(folder: folder)
            })
            Label(folder.name, systemImage: albumsViewModel.returnIcon(folder: folder))
        }
    }
}



#Preview {
    MusicGridElement(albumsViewModel: AlbumsViewModel(), folder: MusicFolderModel(tracks: [], name: "Saved"), folderIndex: 0)
}
