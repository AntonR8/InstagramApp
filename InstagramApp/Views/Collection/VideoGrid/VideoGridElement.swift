//
//  GridElementView.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 12.09.2024.
//

import SwiftUI

struct VideoGridElement: View {
    @Bindable var videosViewModel: VideosViewModel
    let folder: VideoFolderModel
    let folderIndex: Int
    let icon: String
    let imageSize: CGFloat = UIScreen.main.bounds.width/2 - 32

    var body: some View {
        VStack(alignment: .leading) {
            NavigationLink(destination: {
                VideoFolderView(videosViewModel: videosViewModel, folder: folder, folderIndex: folderIndex)
            }, label: {
                if folder.name == "Recents" {
                    RecentsFolderLabel(videosViewModel: videosViewModel)
                } else {
                    VideoGridElementLabel(folder: folder)
                }
            })
            Label(folder.name, systemImage: icon)
        }

    }
}






#Preview {
    VideoGridElement(videosViewModel: VideosViewModel(), folder: VideoFolderModel(
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
    ), folderIndex: 0, icon: "heart")

}
