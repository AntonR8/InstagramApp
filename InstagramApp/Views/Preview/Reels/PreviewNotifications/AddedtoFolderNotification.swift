//
//  AddedtoFolderNotification.swift
//  InstagramApp
//
//  Created by Антон Разгуляев on 22.11.2024.
//

import SwiftUI

struct AddedtoFolderNotification: View {
    var videosViewModel: VideosViewModel

    var body: some View {
        CapsuleNotification(message: "Added to folder")
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now()+3) {
                    videosViewModel.showAddedToFolder = false
                }
            }
    }
}

#Preview {
    AddedtoFolderNotification(videosViewModel: VideosViewModel())
}
