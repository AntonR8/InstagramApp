//
//  AudioSavedNotification.swift
//  InstagramApp
//
//  Created by Антон Разгуляев on 22.11.2024.
//

import SwiftUI

struct AudioSavedNotification: View {
    var mainViewModel: MainViewModel

    var body: some View {
        CapsuleNotification(message: "Saved audio from video")
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now()+3) {
                    mainViewModel.showAudioSavedToFiles = false
                }
            }
    }
}

#Preview {
    AudioSavedNotification(mainViewModel: MainViewModel())
}
