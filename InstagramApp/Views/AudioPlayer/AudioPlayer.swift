//
//  AudioPlayer.swift
//  SaveTik
//
//  Created by Антон Разгуляев on 11.11.2024.
//

import SwiftUI
import AVKit


struct AudioPlayer: View {
    var audioPlayerViewModel: AudioPlayerViewModel

    var body: some View {
        VStack {
            PlayerSlider(audioPlayerViewModel: audioPlayerViewModel)
            HStack {
                ClosePlayerButton(audioPlayerViewModel: audioPlayerViewModel)
                TrackCover(trackCoverURL: audioPlayerViewModel.returnTrackCoverURL())
                VStack(alignment: .leading) {
                    Text(audioPlayerViewModel.returnTrackTitle())
                    Text(audioPlayerViewModel.returnTrackCreator())
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                .lineLimit(1)
                Spacer(minLength: 1)
                PlayPauseButton(trackURL: audioPlayerViewModel.returnTrackURL(), audioPlayerViewModel: audioPlayerViewModel)
                ForwardButton(audioPlayerViewModel: audioPlayerViewModel)
            }
        }
      
        .onReceive(Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()) { _ in
            audioPlayerViewModel.updateProgress()
        }
        .padding(8)
        .background(Color.black)
        .onDisappear {
            audioPlayerViewModel.pause()
        }
    }
}

#Preview {
    ZStack {
        Color.green
        AudioPlayer(audioPlayerViewModel: AudioPlayerViewModel(playlist: []))
    }
}
