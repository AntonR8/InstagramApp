//
//  NoVideosView.swift
//  TikTokApp
//
//  Created by Антон Разгуляев on 01.11.2024.
//

import SwiftUI

struct NoVideosView: View {

    let folder: VideoFolderModel
    var action: DismissAction

    var icon: String { folder.name == "Recents" ? "clock.arrow.circlepath" : "folder"}
    var title: String { folder.name == "Recents" ? "No recent videos" : "No videos"}
    var description: String {folder.name == "Recents" ? "Search through our search on the main TikTok video and it will show up here" : "Open any video you want and click “add...” to save it in that folder"}

    var body: some View {
        VStack {
            Spacer()
            Image(systemName: icon)
                .font(.largeTitle)
                .foregroundStyle(.secondary)
                .padding(4)
            Text(title)
                .font(.title3)
                .bold()
                .padding(8)
            Text(description)
                .font(.footnote)
                .padding(.horizontal, 50)
                .multilineTextAlignment(.center)

            if folder.name == "Recents" {
                CapsuleButton(title: "Find", rightIcon: "arrow.forward") {
//                    vm.tabSelection = 1
                    action()
                }
                .frame(width: 200)
                .padding()
            }
            Spacer()
        }
    }
}

#Preview {
    @Previewable @Environment(\.dismiss) var dismiss
    NoVideosView(folder: VideoFolderModel(clips: [], name: "Recents"), action: dismiss)
}
