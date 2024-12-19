//
//  SelectVideoFolderList.swift
//  SaveTik
//
//  Created by АнтохаПрограммист on 17.11.2024.
//

import SwiftUI

struct SelectStoriesFolderList: View {
    @Binding var selectedFolderIndex: Int?
    var storiesViewModel: StoriesViewModel

    var body: some View {
        List {
            if !storiesViewModel.stories.isEmpty {
                ForEach(Array(zip(storiesViewModel.stories.indices, storiesViewModel.stories)), id: \.0) { index, folder in
                    if folder.name != "Recents" {
                        StoriesListElement(folderIndex: index, storiesViewModel: storiesViewModel, folder: folder, selectedFolderIndex: $selectedFolderIndex)
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
    SelectStoriesFolderList(selectedFolderIndex: .constant(0), storiesViewModel: StoriesViewModel())
}
