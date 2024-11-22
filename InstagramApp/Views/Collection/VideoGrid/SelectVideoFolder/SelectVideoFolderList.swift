//
//  SelectVideoFolderList.swift
//  SaveTik
//
//  Created by АнтохаПрограммист on 17.11.2024.
//

import SwiftUI

struct SelectVideoFolderList: View {
    @Binding var selectedFolderIndex: Int?
    var videosViewModel: VideosViewModel

    var body: some View {
        List {
            if !videosViewModel.videos.isEmpty {
                ForEach(Array(zip(videosViewModel.videos.indices, videosViewModel.videos)), id: \.0) { index, folder in
                    if folder.name != "Recents" {
                        VideoListElement(folderIndex: index, videosViewModel: videosViewModel, folder: folder, selectedFolderIndex: $selectedFolderIndex)
                    }
                }
            }
        }
    }
}

#Preview {
    SelectVideoFolderList(selectedFolderIndex: .constant(0), videosViewModel: VideosViewModel())
}
