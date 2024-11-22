//
//  GridView.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 12.09.2024.
//

import SwiftUI

struct VideoGrid: View {
    var videosViewModel: VideosViewModel

    var body: some View {
        LazyVGrid(columns: [GridItem(), GridItem()], spacing: 16,content: {
            ForEach(Array(zip(videosViewModel.videos.indices, videosViewModel.videos)), id: \.0) { index, folder in
                VideoGridElement(videosViewModel: videosViewModel, folder: folder, folderIndex: index, icon: videosViewModel.returnIcon(folderName: folder.name))
            }
        })
        .onAppear{
            videosViewModel.loadVideos()
        }
        .newVideoFolderAllert(videosViewModel: videosViewModel)

    }
}

#Preview { 
    VideoGrid(videosViewModel: VideosViewModel())
}
