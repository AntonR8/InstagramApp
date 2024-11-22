//
//  TrackList.swift
//  TikTokApp
//
//  Created by Антон Разгуляев on 01.11.2024.
//

import SwiftUI

struct TrackList: View {
    var albumsViewModel: AlbumsViewModel
    var folder: MusicFolderModel
    var audioPlayerViewModel: AudioPlayerViewModel

    var body: some View {
        ScrollView {
            VStack {
                ForEach(Array(zip(folder.tracks.indices, folder.tracks)), id: \.0) { index, track in
                    TrackListRow(
                        track: track,
                        index: index,
                        folder: folder,
                        albumsViewModel: albumsViewModel,
                        audioPlayerViewModel: audioPlayerViewModel
                    )
                }
            }
            .listStyle(.plain)
        }
    }
}









#Preview {
    TrackList(albumsViewModel: AlbumsViewModel(), folder: MusicFolderModel(tracks: [
        TrackModel(title: "In The End - Mellen Gi Remix", creator: "fleuriemusic", cover: "http://p77-sg.tiktokcdn.com/aweme/200x200/tos-alisg-v-2774/oUeCAfEfBp0MFDFgEQAoz5QDAE4agSAHJI0BEA.jpeg", trend: "up", url: "https://sf16-ies-music-sg.tiktokcdn.com/obj/tos-alisg-ve-2774/ee731b9e546a4511baa800e4bc456756"),
        TrackModel(title: "Monkeyshine-JP", creator: "Lt FitzGibbons Men", cover: "http://p77-sg.tiktokcdn.com/aweme/200x200/tiktok-obj/anthem_clip_cover.jpeg.jpeg", trend: "up", url: "https://sf16-ies-music-sg.tiktokcdn.com/obj/tos-alisg-ve-2774/3c2b16b99d77407f8c7cff1d1c477b2b")
    ], name: "jhgjh"), audioPlayerViewModel: AudioPlayerViewModel(playlist: [
        TrackModel(title: "In The End - Mellen Gi Remix", creator: "fleuriemusic", cover: "http://p77-sg.tiktokcdn.com/aweme/200x200/tos-alisg-v-2774/oUeCAfEfBp0MFDFgEQAoz5QDAE4agSAHJI0BEA.jpeg", trend: "up", url: "https://sf16-ies-music-sg.tiktokcdn.com/obj/tos-alisg-ve-2774/ee731b9e546a4511baa800e4bc456756"),
        TrackModel(title: "Monkeyshine-JP", creator: "Lt FitzGibbons Men", cover: "http://p77-sg.tiktokcdn.com/aweme/200x200/tiktok-obj/anthem_clip_cover.jpeg.jpeg", trend: "up", url: "https://sf16-ies-music-sg.tiktokcdn.com/obj/tos-alisg-ve-2774/3c2b16b99d77407f8c7cff1d1c477b2b")
    ]))
}
