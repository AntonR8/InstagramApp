//
//  ErrorSavingImageNotification.swift
//  InstagramApp
//
//  Created by Антон Разгуляев on 26.11.2024.
//

import SwiftUI

struct ErrorSavingImageNotification: View {
    var mainViewModel: MainViewModel

    var body: some View {
        CapsuleNotification(message: "Error, please try again", isErrorNotification: true)
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now()+3) {
                    mainViewModel.showErrorSavingImage = false
                }
            }
    }
}

#Preview {
    ErrorSavingImageNotification(mainViewModel: MainViewModel())
}
