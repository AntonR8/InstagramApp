//
//  PlayButton.swift
//  TikTokApp
//
//  Created by Антон Разгуляев on 21.10.2024.
//

import SwiftUI

struct PlayButton: View {
    var audioPlayerViewModel: AudioPlayerViewModel
    let trackIndex: Int

    func returnIsPlaying() -> Bool {
        if audioPlayerViewModel.trackIndex == trackIndex {
           if audioPlayerViewModel.isPlaying {
                return true
           } else { return false }
        } else { return false }
    }

    var body: some View {
        Button {
            audioPlayerViewModel.albumPlayButtonPushed(index: trackIndex)
        } label: {
            Image(systemName: returnIsPlaying() ? "pause.fill" : "play.fill")
                .foregroundColor(returnIsPlaying() ? .accent : .white)
                .padding(8)
                .background(returnIsPlaying() ? .clear : .accent)
                .clipShape(Circle())
                .overlay {
                    Circle()
                        .fill(.clear)
                        .stroke(.accent, lineWidth: 2)
                }
        }
    }
}

#Preview {
    PlayButton(audioPlayerViewModel: AudioPlayerViewModel(playlist: []), trackIndex: 0)
}
