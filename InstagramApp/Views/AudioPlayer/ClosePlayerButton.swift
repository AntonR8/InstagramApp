//
//  ClosePlayerButton.swift
//  SaveTik
//
//  Created by Антон Разгуляев on 12.11.2024.
//

import SwiftUI

struct ClosePlayerButton: View {
    var audioPlayerViewModel: AudioPlayerViewModel

    var body: some View {
        Button {
            audioPlayerViewModel.closeButtonPushed()
        } label: {
            Image(systemName: "xmark")
                .foregroundStyle(.gray)
                .padding(.horizontal, 8)
        }

    }
}

#Preview {
    ClosePlayerButton(audioPlayerViewModel: AudioPlayerViewModel(playlist: []))
}
