//
//  VideoCover.swift
//  TikTokApp
//
//  Created by Антон Разгуляев on 17.10.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct VideoCover: View {
    var videosViewModel: VideosViewModel
    let clip: ClipInfoModel
    let folder: VideoFolderModel

    var body: some View {
        RoundedRectangle(cornerRadius: 16)
            .fill(Color.gray.opacity(0.2))
            .frame(width: UIScreen.main.bounds.width/2 - 24, height: (UIScreen.main.bounds.width/2 - 24)/9*16)
            .overlay {
                if let imageVideoPreview = folder.clips.last?.videoPreview {
                    WebImage(url: URL(string: clip.videoPreview)) { image in
                        image.resizable()
                    } placeholder: {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.gray.opacity(0.1))
                    }
                    .indicator(.activity)
                    .scaledToFit()
                    .cornerRadius(16)
                }
            }
            .overlay(alignment: .topTrailing) {
                EllipsisButton(
                    background: .black.opacity(0.3),
                    foregroundStyle: .white,
                    videofolder: folder,
                    clip: clip,
                    button1title: "Add...", button1icon: "bookmark",
                    button1action: {
                        videosViewModel.showSelectVideoFolders = true
                        videosViewModel.clipForAdd = clip
                    },
                    button2title: "Remove", button2icon: "trash",
                    button2action: {
                        videosViewModel.removeClip(from: folder.name, clip: clip)
                    })
                .padding(8)
            }
    }
}

#Preview {
    NavigationStack {
        VideoCover(videosViewModel: VideosViewModel(), clip: ClipInfoModel(
            username: "e.karepanov",
            name: "Евгений Карепанов",
            avatar: "https://p16-sign-sg.tiktokcdn.com/tos-alisg-avt-0068/b073d1121ab837c7fa40907764b41492~tplv-tiktokx-cropcenter:300:300.jpeg?dr=14577&nonce=93618&refresh_token=5e258beeee132e94f2b89ecdbaa3cd6a&x-expires=1732010400&x-signature=zNrbhznHd3Ln4qlOXwoZ5hDVQ4Y%3D&idc=maliva&ps=13740610&shcp=d05b14bd&shp=45126217&t=4d5b0474",
            videoPreview: "https://p16-sign-sg.tiktokcdn.com/tos-alisg-p-0037/c975424cc6484cc9a94cf184f371b144_1600024896~tplv-tiktokx-360p.jpeg?dr=14555&nonce=57883&refresh_token=446bf74b1135ae2ee3ff48d7ebfb2cc5&x-expires=1732010400&x-signature=5VtLfCJZGogl8RCpTAmKs4D%2FXC4%3D&ftpl=1&idc=maliva&ps=13740610&s=AWEME_DETAIL&shcp=34ff8df6&shp=d05b14bd&t=4d5b0474",
            description: "Звуки природы . Релакс видео .#рассвет #природа #релакс #красота #солнышко #лето #вятка",
            musicTitle: "original sound - e.karepanov",
            musicUrl: "https://sf16-ies-music-sg.tiktokcdn.com/obj/tiktok-obj/6872054520516496129.mp3"
        ), folder: VideoFolderModel(
            clips: [ClipInfoModel(
                username: "e.karepanov",
                name: "Евгений Карепанов",
                avatar: "https://p16-sign-sg.tiktokcdn.com/tos-alisg-avt-0068/b073d1121ab837c7fa40907764b41492~tplv-tiktokx-cropcenter:300:300.jpeg?dr=14577&nonce=93618&refresh_token=5e258beeee132e94f2b89ecdbaa3cd6a&x-expires=1732010400&x-signature=zNrbhznHd3Ln4qlOXwoZ5hDVQ4Y%3D&idc=maliva&ps=13740610&shcp=d05b14bd&shp=45126217&t=4d5b0474",
                videoPreview: "https://p16-sign-sg.tiktokcdn.com/tos-alisg-p-0037/c975424cc6484cc9a94cf184f371b144_1600024896~tplv-tiktokx-360p.jpeg?dr=14555&nonce=57883&refresh_token=446bf74b1135ae2ee3ff48d7ebfb2cc5&x-expires=1732010400&x-signature=5VtLfCJZGogl8RCpTAmKs4D%2FXC4%3D&ftpl=1&idc=maliva&ps=13740610&s=AWEME_DETAIL&shcp=34ff8df6&shp=d05b14bd&t=4d5b0474",
                description: "Звуки природы . Релакс видео .#рассвет #природа #релакс #красота #солнышко #лето #вятка",
                musicTitle: "original sound - e.karepanov",
                musicUrl: "https://sf16-ies-music-sg.tiktokcdn.com/obj/tiktok-obj/6872054520516496129.mp3"
            )

            ],
            name: "Saved"
        ))
    }
}