//
//  NoVideosView.swift
//  TikTokApp
//
//  Created by Антон Разгуляев on 01.11.2024.
//

import SwiftUI

struct NoProfilesView: View {
    @Environment(NavigationViewModel.self) var navigationViewModel
    let folder: ProfileFolderModel
    var action: DismissAction

    var icon: String { folder.name == "Recents" ? "clock.arrow.circlepath" : "folder"}
    var title: String { folder.name == "Recents" ? "No recent profiles" : "No profiles"}
    var description: String {folder.name == "Recents" ? "Search through our search on the main Instagram profiles and it will show up here" : "Open any profile you want and click “add...” to save it in that folder"}

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
                    navigationViewModel.tabSelection = 1
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
    NoProfilesView(folder: ProfileFolderModel(profilesArray: [], name: "Recents"), action: dismiss)
        .environment(NavigationViewModel())
}
