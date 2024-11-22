//
//  SwiftUIView.swift
//  SaveTik
//
//  Created by Антон Разгуляев on 11.11.2024.
//

import SwiftUI

struct PlayPauseButton: View {
    var trackURL: String
    var audioPlayerViewModel: AudioPlayerViewModel

    var body: some View {
        Button {
            audioPlayerViewModel.playPauseButtonPushed()
        } label: {
            Image(systemName: audioPlayerViewModel.isPlaying ? "pause.fill" : "play.fill")
                .font(.title3)
                .padding(8)
                .foregroundStyle(audioPlayerViewModel.isPlaying ? .accent : .white)
                .background(
                    Circle()
                        .fill(audioPlayerViewModel.isPlaying ? .clear : .accent)
                        .stroke(.accent, lineWidth: 1)
                )
        }
    }
}

#Preview {
    PlayPauseButton(trackURL: "https://sf16-ies-music-sg.tiktokcdn.com/obj/tos-alisg-ve-2774/8b7574ae7d864d259bc0ee18880505fe", audioPlayerViewModel: AudioPlayerViewModel(playlist: []))
}
