//
//  ErrorSavingAudioNotification.swift
//  InstagramApp
//
//  Created by Антон Разгуляев on 22.11.2024.
//

import SwiftUI

struct ErrorSavingAudioNotification: View {
    var reelsViewModel: ReelsViewModel

    var body: some View {
        CapsuleNotification(message: "Error saving audio from video", isErrorNotification: true)
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now()+3) {
                    reelsViewModel.showErrorSavingAudio = false
                }
            }
    }
}

#Preview {
    ErrorSavingAudioNotification(reelsViewModel: ReelsViewModel())
}
