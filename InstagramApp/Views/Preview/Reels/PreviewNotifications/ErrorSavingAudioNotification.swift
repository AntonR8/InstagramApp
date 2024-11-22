//
//  ErrorSavingAudioNotification.swift
//  InstagramApp
//
//  Created by Антон Разгуляев on 22.11.2024.
//

import SwiftUI

struct ErrorSavingAudioNotification: View {
    var mainViewModel: MainViewModel

    var body: some View {
        CapsuleNotification(message: "Error saving audio from video", isErrorNotification: true)
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now()+3) {
                    mainViewModel.showErrorSavingAudio = false
                }
            }
    }
}

#Preview {
    ErrorSavingAudioNotification(mainViewModel: MainViewModel())
}
