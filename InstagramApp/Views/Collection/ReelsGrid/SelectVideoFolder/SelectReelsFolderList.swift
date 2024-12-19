//
//  SelectVideoFolderList.swift
//  SaveTik
//
//  Created by АнтохаПрограммист on 17.11.2024.
//

import SwiftUI

struct SelectReelsFolderList: View {
    @Binding var selectedFolderIndex: Int?
    var reelsViewModel: ReelsViewModel

    var body: some View {
        List {
            if !reelsViewModel.reelsArray.isEmpty {
                ForEach(Array(zip(reelsViewModel.reelsArray.indices, reelsViewModel.reelsArray)), id: \.0) { index, folder in
                    if folder.name != "Recents" {
                        ReelsListElement(folderIndex: index, reelsViewModel: reelsViewModel, folder: folder, selectedFolderIndex: $selectedFolderIndex)
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
    SelectReelsFolderList(selectedFolderIndex: .constant(0), reelsViewModel: ReelsViewModel())
}
