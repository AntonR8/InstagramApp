//
//  ImageView.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 26.09.2024.
//

import SwiftUI

struct VideoFolderView: View {
    @Bindable var videosViewModel: VideosViewModel
    @Environment(\.dismiss) var dismiss
    let folder: VideoFolderModel
    let folderIndex: Int
    var folderClipsCount: Int { folder.clips.count }

    var navTitle: String? { nil }

    var body: some View {
        VStack(alignment: .leading) {
            Text("\(folderClipsCount) saved videos")
                .font(.footnote)
                .padding(.horizontal)
                .navigationTitle(navTitle ?? folder.name)
            if folder.clips.isEmpty {
                NoVideosView(folder: folder, action: dismiss)
            } else {
                ScrollView {
                    LazyVGrid(columns: [GridItem(spacing: 8), GridItem(spacing: 8)], spacing: 12,content: {
                        ForEach(Array(zip(folder.clips.indices, folder.clips)), id: \.0) { index, clip in
                            VideoCover(videosViewModel: videosViewModel, clip: clip, folder: folder)
                        }
                    })
                }
                .padding(16)
            }
        }
        .onAppear(perform: {
            videosViewModel.showSelectVideoFolders = false
        })
        .sheet(isPresented: $videosViewModel.showSelectVideoFolders) {
            SelectVideoFolder(videosViewModel: videosViewModel)
                .presentationDetents([.medium])
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                if folder.name != "Saved" && folder.name != "Recents" {
                    EllipsisButton(
                        button1title: "Rename", button1icon: "pencil",
                        button1action: {
                            videosViewModel.renameFolderPressed(folderName: folder.name)
                        },
                        button2title: "Delete", button2icon: "trash",
                        button2action: {
                            videosViewModel.deleteFolder(folderIndex: folderIndex)
                            dismiss()
                        })
                }
            }
        }
        .renameVideoFolderAllert(videosViewModel: videosViewModel)
    }
}


#Preview {
    NavigationStack {
        VideoFolderView(videosViewModel: VideosViewModel(), folder: VideoFolderModel(clips: [ClipInfoModel(
            username: "e.karepanov",
            name: "Евгений Карепанов",
            avatar: "https://p16-sign-sg.tiktokcdn.com/tos-alisg-avt-0068/b073d1121ab837c7fa40907764b41492~tplv-tiktokx-cropcenter:300:300.jpeg?dr=14577&nonce=93618&refresh_token=5e258beeee132e94f2b89ecdbaa3cd6a&x-expires=1732010400&x-signature=zNrbhznHd3Ln4qlOXwoZ5hDVQ4Y%3D&idc=maliva&ps=13740610&shcp=d05b14bd&shp=45126217&t=4d5b0474",
            videoPreview: "https://p16-sign-sg.tiktokcdn.com/tos-alisg-p-0037/c975424cc6484cc9a94cf184f371b144_1600024896~tplv-tiktokx-360p.jpeg?dr=14555&nonce=57883&refresh_token=446bf74b1135ae2ee3ff48d7ebfb2cc5&x-expires=1732010400&x-signature=5VtLfCJZGogl8RCpTAmKs4D%2FXC4%3D&ftpl=1&idc=maliva&ps=13740610&s=AWEME_DETAIL&shcp=34ff8df6&shp=d05b14bd&t=4d5b0474",
            description: "Звуки природы . Релакс видео .#рассвет #природа #релакс #красота #солнышко #лето #вятка",
            musicTitle: "original sound - e.karepanov",
            musicUrl: "https://sf16-ies-music-sg.tiktokcdn.com/obj/tiktok-obj/6872054520516496129.mp3"
        ),
                                                                                             ClipInfoModel(
                                                                                                 username: "e.karepanov",
                                                                                                 name: "Евгений Карепанов",
                                                                                                 avatar: "https://p16-sign-sg.tiktokcdn.com/tos-alisg-avt-0068/b073d1121ab837c7fa40907764b41492~tplv-tiktokx-cropcenter:300:300.jpeg?dr=14577&nonce=93618&refresh_token=5e258beeee132e94f2b89ecdbaa3cd6a&x-expires=1732010400&x-signature=zNrbhznHd3Ln4qlOXwoZ5hDVQ4Y%3D&idc=maliva&ps=13740610&shcp=d05b14bd&shp=45126217&t=4d5b0474",
                                                                                                 videoPreview: "https://p16-sign-sg.tiktokcdn.com/tos-alisg-p-0037/c975424cc6484cc9a94cf184f371b144_1600024896~tplv-tiktokx-360p.jpeg?dr=14555&nonce=57883&refresh_token=446bf74b1135ae2ee3ff48d7ebfb2cc5&x-expires=1732010400&x-signature=5VtLfCJZGogl8RCpTAmKs4D%2FXC4%3D&ftpl=1&idc=maliva&ps=13740610&s=AWEME_DETAIL&shcp=34ff8df6&shp=d05b14bd&t=4d5b0474",
                                                                                                 description: "Звуки природы . Релакс видео .#рассвет #природа #релакс #красота #солнышко #лето #вятка",
                                                                                                 musicTitle: "original sound - e.karepanov",
                                                                                                 musicUrl: "https://sf16-ies-music-sg.tiktokcdn.com/obj/tiktok-obj/6872054520516496129.mp3"
                                                                                             ),
                                                                                             ClipInfoModel(
                                                                                                 username: "e.karepanov",
                                                                                                 name: "Евгений Карепанов",
                                                                                                 avatar: "https://p16-sign-sg.tiktokcdn.com/tos-alisg-avt-0068/b073d1121ab837c7fa40907764b41492~tplv-tiktokx-cropcenter:300:300.jpeg?dr=14577&nonce=93618&refresh_token=5e258beeee132e94f2b89ecdbaa3cd6a&x-expires=1732010400&x-signature=zNrbhznHd3Ln4qlOXwoZ5hDVQ4Y%3D&idc=maliva&ps=13740610&shcp=d05b14bd&shp=45126217&t=4d5b0474",
                                                                                                 videoPreview: "https://p16-sign-sg.tiktokcdn.com/tos-alisg-p-0037/c975424cc6484cc9a94cf184f371b144_1600024896~tplv-tiktokx-360p.jpeg?dr=14555&nonce=57883&refresh_token=446bf74b1135ae2ee3ff48d7ebfb2cc5&x-expires=1732010400&x-signature=5VtLfCJZGogl8RCpTAmKs4D%2FXC4%3D&ftpl=1&idc=maliva&ps=13740610&s=AWEME_DETAIL&shcp=34ff8df6&shp=d05b14bd&t=4d5b0474",
                                                                                                 description: "Звуки природы . Релакс видео .#рассвет #природа #релакс #красота #солнышко #лето #вятка",
                                                                                                 musicTitle: "original sound - e.karepanov",
                                                                                                 musicUrl: "https://sf16-ies-music-sg.tiktokcdn.com/obj/tiktok-obj/6872054520516496129.mp3"
                                                                                             )




        ], name: "Fuck"), folderIndex: 0)

    }
}
