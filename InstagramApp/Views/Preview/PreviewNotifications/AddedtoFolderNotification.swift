//
//  AddedtoFolderNotification.swift
//  InstagramApp
//
//  Created by Антон Разгуляев on 22.11.2024.
//

import SwiftUI

struct AddedtoFolderNotification: View {
    var reelsViewModel: ReelsViewModel

    var body: some View {
        CapsuleNotification(message: "Added to folder")
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now()+3) {
                    reelsViewModel.showAddedToFolder = false
                }
            }
    }
}

#Preview {
    AddedtoFolderNotification(reelsViewModel: ReelsViewModel())
}
