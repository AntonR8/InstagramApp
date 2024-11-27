//
//  Menu.swift
//  TikTokApp
//
//  Created by Антон Разгуляев on 17.10.2024.
//

import SwiftUI

struct ReelsMenuView: View {
    var reelsViewModel: ReelsViewModel
    var mainViewModel: MainViewModel
    let reels: ReelsModel

    var body: some View {
        HStack(alignment: .top) {
            if let url = URL(string: reels.videoDownloadURL) {
                ShareLink(item: url) {
                    MenuElement(icon: "square.and.arrow.up", title: "Share video")
                }
            }

            Button {
                if mainViewModel.reelsData != nil {
                    reelsViewModel.reelsForAdd = mainViewModel.reelsData
                    reelsViewModel.showSelectVideoFolders = true
                } else { print("clipInfo ПУСТОЙ") }
            } label: { MenuElement(icon: "bookmark", title: "Add...") }

            Button {
                UIPasteboard.general.string = reels.audioTitle
                mainViewModel.showTrackNameCopied = true
            } label: { MenuElement(icon: "doc.on.doc", title: "Copy track name") }
            
            Button {
//                mainViewModel.saveClipAudio()
//                mainViewModel.showAudioSavedToFiles = true
            } label: { MenuElement(icon: "waveform", title: "Save audio") }

        }
        .foregroundStyle(.primary)
    }
}





#Preview {
    NavigationStack {
        ReelsMenuView(reelsViewModel: ReelsViewModel(), mainViewModel: MainViewModel(), reels: mockReelsResponse.data.reels)
    }
}
