//
//  SelectVideoFolder.swift
//  SaveTik
//
//  Created by АнтохаПрограммист on 17.11.2024.
//

import SwiftUI

struct SelectVideoFolder: View {
    @State var selectedFolderIndex: Int?
    @Bindable var videosViewModel: VideosViewModel


    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Select folder")
                    .font(.title3)
                    .bold()
                Spacer()
                SmallImageButton(leftIcon: "xmark", foregroundStyle: .white, action: {
                    videosViewModel.showSelectVideoFolders = false
                })
            }
            .padding()
            SelectVideoFolderList(selectedFolderIndex: $selectedFolderIndex, videosViewModel: videosViewModel)
            HStack {
                CapsuleButton(leftIcon: "plus", title: "New folder", backgroundColor: .clear, foregroundColor: .accent) {
                    videosViewModel.showCreateNewFolderAllert = true
                }
                CapsuleButton(leftIcon: "checkmark", title: "Save") {
                    if let selectedFolderIndex {
                        videosViewModel.buttonSaveClipInFolderAction(selectedFolderIndex: selectedFolderIndex)
                    }
                }
                .disabled(selectedFolderIndex == nil)
            }
            .padding()
        }
        .renameVideoFolderAllert(videosViewModel: videosViewModel)
    }
}

#Preview {
    SelectVideoFolder(videosViewModel: VideosViewModel())
}
