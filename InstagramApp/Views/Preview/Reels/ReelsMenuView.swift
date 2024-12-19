

import SwiftUI

struct ReelsMenuView: View {
    var reelsViewModel: ReelsViewModel
    let reels: ReelsModel

    var body: some View {
        HStack(alignment: .top) {
            if let url = URL(string: reels.videoDownloadUrl) {
                ShareLink(item: url) {
                    MenuElement(icon: "square.and.arrow.up", title: "Share video")
                }
            }

            Button {
                   reelsViewModel.reelsForAdd = reels
                   reelsViewModel.showSelectVideoFolders = true
            } label: { MenuElement(icon: "bookmark", title: "Add...") }

            Button {
                UIPasteboard.general.string = reels.audioTitle
                reelsViewModel.showTrackNameCopied = true
            } label: { MenuElement(icon: "doc.on.doc", title: "Copy track name") }
            
            Button {
                reelsViewModel.saveClipAudio(reelsData: reels)
                reelsViewModel.showAudioSavedToFiles = true
            } label: { MenuElement(icon: "waveform", title: "Save audio") }

        }
        .foregroundStyle(.primary)
    }
}





#Preview {
    NavigationStack {
        ReelsMenuView(reelsViewModel: ReelsViewModel(), reels: mockReelsResponse.data.reels)
    }
}
