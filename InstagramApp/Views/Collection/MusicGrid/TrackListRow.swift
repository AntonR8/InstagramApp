//
//  TrackListRow.swift
//  TikTokApp
//
//  Created by Антон Разгуляев on 01.11.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct TrackListRow: View {
    let track: TrackModel
    let index: Int
    var folder: MusicFolderModel
    var albumsViewModel: AlbumsViewModel
    var audioPlayerViewModel: AudioPlayerViewModel

    var body: some View {
        VStack {
            HStack {
                TrackCover(trackCoverURL: track.cover)
                VStack(alignment: .leading) {
                    Text(track.title)
                    Text(track.creator)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                Spacer()
                Button {
                    albumsViewModel.removeTrack(from: folder.name, track: track)
                } label: {
                    Image(systemName: albumsViewModel.checkTrackIsSaved(track: track) ? "bookmark.fill" : "bookmark")
                        .padding(.horizontal, 8)
                        .foregroundStyle(albumsViewModel.checkTrackIsSaved(track: track) ? .red : .secondary)
                }
                PlayButton(audioPlayerViewModel: audioPlayerViewModel, trackIndex: index)
            }
            Divider()
        }
    }
}







    #Preview {
        TrackListRow(track:      TrackModel(title: "In The End - Mellen Gi Remix", creator: "fleuriemusic", cover: "http://p77-sg.tiktokcdn.com/aweme/200x200/tos-alisg-v-2774/oUeCAfEfBp0MFDFgEQAoz5QDAE4agSAHJI0BEA.jpeg", trend: "up", url: "https://sf16-ies-music-sg.tiktokcdn.com/obj/tos-alisg-ve-2774/ee731b9e546a4511baa800e4bc456756"), index: 0, folder: MusicFolderModel(tracks: [
            TrackModel(title: "In The End - Mellen Gi Remix", creator: "fleuriemusic", cover: "http://p77-sg.tiktokcdn.com/aweme/200x200/tos-alisg-v-2774/oUeCAfEfBp0MFDFgEQAoz5QDAE4agSAHJI0BEA.jpeg", trend: "up", url: "https://sf16-ies-music-sg.tiktokcdn.com/obj/tos-alisg-ve-2774/ee731b9e546a4511baa800e4bc456756"),
            TrackModel(title: "Monkeyshine-JP", creator: "Lt FitzGibbons Men", cover: "http://p77-sg.tiktokcdn.com/aweme/200x200/tiktok-obj/anthem_clip_cover.jpeg.jpeg", trend: "up", url: "https://sf16-ies-music-sg.tiktokcdn.com/obj/tos-alisg-ve-2774/3c2b16b99d77407f8c7cff1d1c477b2b")
        ], name: "jhgjh"), albumsViewModel: AlbumsViewModel(), audioPlayerViewModel: AudioPlayerViewModel(playlist: [
            TrackModel(title: "In The End - Mellen Gi Remix", creator: "fleuriemusic", cover: "http://p77-sg.tiktokcdn.com/aweme/200x200/tos-alisg-v-2774/oUeCAfEfBp0MFDFgEQAoz5QDAE4agSAHJI0BEA.jpeg", trend: "up", url: "https://sf16-ies-music-sg.tiktokcdn.com/obj/tos-alisg-ve-2774/ee731b9e546a4511baa800e4bc456756"),
            TrackModel(title: "Monkeyshine-JP", creator: "Lt FitzGibbons Men", cover: "http://p77-sg.tiktokcdn.com/aweme/200x200/tiktok-obj/anthem_clip_cover.jpeg.jpeg", trend: "up", url: "https://sf16-ies-music-sg.tiktokcdn.com/obj/tos-alisg-ve-2774/3c2b16b99d77407f8c7cff1d1c477b2b")
        ]))
    }
