//
//  SelectVideoFolder.swift
//  SaveTik
//
//  Created by АнтохаПрограммист on 17.11.2024.
//

import SwiftUI

struct SelectReelsFolder: View {
    @State var selectedFolderIndex: Int?
    @Bindable var reelsViewModel: ReelsViewModel


    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Select folder")
                    .font(.title3)
                    .bold()
                Spacer()
                SmallImageButton(leftIcon: "xmark", foregroundStyle: .white, action: {
                    reelsViewModel.showSelectVideoFolders = false
                })
            }
            .padding()
            SelectReelsFolderList(selectedFolderIndex: $selectedFolderIndex, reelsViewModel: reelsViewModel)
            HStack {
                CapsuleButton(leftIcon: "plus", title: "New folder", backgroundColor: .clear, foregroundColor: .accent) {
                    reelsViewModel.showCreateNewFolderAllert = true
                }
                CapsuleButton(leftIcon: "checkmark", title: "Save") {
                    if let selectedFolderIndex {
                        reelsViewModel.buttonSaveClipInFolderAction(selectedFolderIndex: selectedFolderIndex)
                    }
                }
                .disabled(selectedFolderIndex == nil)
            }
            .padding()
        }
        .renameReelsFolderAllert(reelsViewModel: reelsViewModel)
    }
}

#Preview {
    SelectReelsFolder(reelsViewModel: ReelsViewModel())
}
