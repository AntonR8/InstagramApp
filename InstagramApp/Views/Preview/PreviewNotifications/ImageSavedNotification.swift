//
//  ImageSavedNotification.swift
//  InstagramApp
//
//  Created by Антон Разгуляев on 26.11.2024.
//

import SwiftUI

struct ImageSavedNotification: View {
    var mainViewModel: MainViewModel

    var body: some View {
        CapsuleNotification(message: "Image saved")
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now()+3) {
                    mainViewModel.showImageSaved = false
                }
            }
    }
}

#Preview {
    ImageSavedNotification(mainViewModel: MainViewModel())
}
