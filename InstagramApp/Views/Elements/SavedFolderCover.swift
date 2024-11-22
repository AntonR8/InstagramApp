//
//  MusicGridElementLabel.swift
//  TikTokApp
//
//  Created by Антон Разгуляев on 01.11.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct SavedFolderCover: View {
    let folder: MusicFolderModel
    let folderSize: CGFloat = UIScreen.main.bounds.width/2 - 24
    let imagecornerRadius: CGFloat = 16
    
    
    var body: some View {
        
        RoundedRectangle(cornerRadius: 20)
            .fill(Color.gray.opacity(0.2))
            .frame(width: folderSize, height: folderSize)
            .overlay {
                if let trackCover = folder.tracks.last?.cover {
                    WebImage(url: URL(string:"https" + trackCover.dropFirst(4))) { image in
                        image.resizable()
                    } placeholder: { Rectangle().foregroundColor(.gray) }
                        .indicator(.activity)
                        .scaledToFill()
                        .cornerRadius(5)
                        .frame(width: folderSize-24, height: folderSize-24)
                        .clipped()
                        .cornerRadius(imagecornerRadius)
                } else {
                    RoundedRectangle(cornerRadius: imagecornerRadius)
                        .fill(.gray.opacity(0.1))
                        .frame(width: folderSize-24, height: folderSize-24)
                }
            }
    }
}

#Preview {
    SavedFolderCover(folder: MusicFolderModel(tracks: [], name: "Saved"))
}
