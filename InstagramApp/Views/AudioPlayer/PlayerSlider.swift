//
//  PlayerSlider.swift
//  SaveTik
//
//  Created by Антон Разгуляев on 12.11.2024.
//

import SwiftUI
import AVKit

struct PlayerSlider: View {
    var audioPlayerViewModel: AudioPlayerViewModel

    var body: some View {
        VStack {
            Slider(value: Binding(get: { audioPlayerViewModel.currentTime },
                                  set: { newValue in audioPlayerViewModel.seekAudio(to: newValue)
                  }), in: 0...audioPlayerViewModel.totalTime)

            .onAppear {
                let progressCircleConfig = UIImage.SymbolConfiguration(scale: .small)
                UISlider.appearance()
                    .setThumbImage(UIImage(systemName: "circle.fill",
                                           withConfiguration: progressCircleConfig), for: .normal)
            }
            HStack {
                Text(audioPlayerViewModel.returnTrackProgress())
                Spacer()
                Text(audioPlayerViewModel.returnTrackDuration())
                    .foregroundStyle(.secondary)
            }
            .font(.caption2)
            .padding(.top, -16)
        }
    }
}

#Preview {
    ZStack {
        Color.green
        PlayerSlider(audioPlayerViewModel: AudioPlayerViewModel(playlist: []))
            .background {
                Color.black
            }
    }
}
