//
//  StoriesMenuView.swift
//  InstagramApp
//
//  Created by Антон Разгуляев on 26.11.2024.
//

import SwiftUI

struct StoriesMenuView: View {
    var reelsViewModel: ReelsViewModel
    var mainViewModel: MainViewModel
    let stories: StoriesModel

    var body: some View {
        HStack(alignment: .top) {
            if let url = URL(string: stories.requestedUrl) {
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

        }
        .foregroundStyle(.primary)
    }
}

#Preview {
    StoriesMenuView(reelsViewModel: ReelsViewModel(), mainViewModel: MainViewModel(), stories: mockStoriesResponse.data.stories)
}
