//
//  GridView.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 12.09.2024.
//

import SwiftUI

struct StoriesGrid: View {
    var storiesViewModel: StoriesViewModel

    var body: some View {
        LazyVGrid(columns: [GridItem(), GridItem()], spacing: 16,content: {
            ForEach(Array(zip(storiesViewModel.stories.indices, storiesViewModel.stories)), id: \.0) { index, folder in
                StoriesGridElement(storiesViewModel: storiesViewModel, folder: folder, folderIndex: index, icon: storiesViewModel.returnIcon(folderName: folder.name))
            }
        })
        .onAppear{
            storiesViewModel.loadStories()
        }
        .newStoriesFolderAllert(storiesViewModel: storiesViewModel)

    }
}

#Preview { 
    StoriesGrid(storiesViewModel: StoriesViewModel())
}
