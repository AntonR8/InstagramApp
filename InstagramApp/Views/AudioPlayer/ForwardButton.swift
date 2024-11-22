//
//  ForwardButton.swift
//  SaveTik
//
//  Created by Антон Разгуляев on 11.11.2024.
//

import SwiftUI

struct ForwardButton: View {
    var audioPlayerViewModel: AudioPlayerViewModel

    var body: some View {
        Button {
            audioPlayerViewModel.forwardButtonPushed()
        } label: {
            Image(systemName: "forward.fill")
                .foregroundStyle(.gray)
                .padding(.leading, 8)
        }

    }
}

#Preview {
    ForwardButton(audioPlayerViewModel: AudioPlayerViewModel(playlist: []))
}
