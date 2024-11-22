//
//  RenameFolderAllert.swift
//  SaveTik
//
//  Created by АнтохаПрограммист on 17.11.2024.
//

import SwiftUI

struct RenameMusicFolderAllert: ViewModifier {
    @Bindable var albumsViewModel: AlbumsViewModel
    
    func body(content: Content) -> some View {
        content
            .alert("Rename folder", isPresented: $albumsViewModel.showChangeFolderNameAllert) {
                TextField("Folder name", text: $albumsViewModel.newFolderName)
                Button("Cancel",  action: {
                    albumsViewModel.showChangeFolderNameAllert = false
                })
                .accentColor(.accent)
                Button("Save", action: {
                    albumsViewModel.renameFolderSaveButtonPressed()
                })
            }
    }
}


extension View {
    func renameMusicFolderAllert(albumsViewModel: AlbumsViewModel) -> some View {
        modifier(RenameMusicFolderAllert(albumsViewModel: albumsViewModel))
    }
}
