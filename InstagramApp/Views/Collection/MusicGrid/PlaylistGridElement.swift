//
//  PlaylistGridElement.swift
//  TikTokApp
//
//  Created by Антон Разгуляев on 01.11.2024.
//

import SwiftUI

struct PlaylistGridElement: View {
    let playlist: CountryChart

    var body: some View {
        VStack(alignment: .leading) {
            NavigationLink(destination: {
                AlbumView(chart: playlist)
            }, label: {
                PlaylistCover(imageName: playlist.image, width: UIScreen.main.bounds.width/2 - 24, height: UIScreen.main.bounds.width/2 - 24, countryTitle: playlist.title)
            })
//            Label(playlist.title, systemImage: "music.note.list")
        }

    }
}


//#Preview {
//    PlaylistGridElement(playlist: CountryChart(id: <#T##Int#>, title: <#T##String#>, pos: <#T##Int#>, isPremium: <#T##Bool#>, image: <#T##String#>, music: <#T##[TrackModel]#>))
//}
