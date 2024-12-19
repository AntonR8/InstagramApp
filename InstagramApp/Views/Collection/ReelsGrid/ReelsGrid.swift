//
//  GridView.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 12.09.2024.
//

import SwiftUI

struct ReelsGrid: View {
    var reelsViewModel: ReelsViewModel

    var body: some View {
        LazyVGrid(columns: [GridItem(), GridItem()], spacing: 16,content: {
            ForEach(Array(zip(reelsViewModel.reelsArray.indices, reelsViewModel.reelsArray)), id: \.0) { index, folder in
                ReelsGridElement(reelsViewModel: reelsViewModel, folder: folder, folderIndex: index, icon: reelsViewModel.returnIcon(folderName: folder.name))
            }
        })
        .onAppear{
            reelsViewModel.loadVideos()
        }
        .newReelsFolderAllert(reelsViewModel: reelsViewModel)

    }
}

#Preview { 
    ReelsGrid(reelsViewModel: ReelsViewModel())
}
