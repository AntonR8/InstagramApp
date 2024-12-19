//
//  AudioSavedNotification.swift
//  InstagramApp
//
//  Created by Антон Разгуляев on 22.11.2024.
//

import SwiftUI

struct AudioSavedNotification: View {
    var reelsViewModel: ReelsViewModel

    var body: some View {
        CapsuleNotification(message: "Saved audio from video")
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now()+3) {
                    reelsViewModel.showAudioSavedToFiles = false
                }
            }
    }
}

#Preview {
    AudioSavedNotification(reelsViewModel: ReelsViewModel())
}
