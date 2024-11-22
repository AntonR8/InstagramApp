
import SwiftUI
import ApphudSDK

struct OpenedSection: View {
    @Environment(NavigationViewModel.self) var navigationViewModel
    let section: SectionModel

    let size: CGFloat = UIScreen.main.bounds.width/2-24

    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(alignment: .top), GridItem(alignment: .top)]) {
                ForEach (section.sets, id: \.self) { country in
                    CardView(chart: country, width: size, height: size*5/4)
                            .padding(.bottom, 4)
                }
            }
        }
        .padding()
        .navigationTitle(section.title)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            if !Apphud.hasPremiumAccess() {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        navigationViewModel.showPaywall = true
                    } label: {
                        ProButtonView()
                    }
                }
            }
        }
    }
}







#Preview {
    OpenedSection(
        section: SectionModel(
            id: 1,
            title: "Америка",
            isMain: false,
            pos: 1,
            sets: [
                CountryChart(
                    id: 1,
                    title: "USA",
                    pos: 2,
                    isPremium: true,
                    image: "https://media-backend.finanse.space/storage/setImages/r3PPAWiAaVxMfmzXVYTpOEbWxf3USRzf3g9W8umY.webp",
                    music: [
                        TrackModel(
                            title: "In The End - Mellen Gi Remix",
                            creator: "fleuriemusic",
                            cover: "http://p77-sg.tiktokcdn.com/aweme/200x200/tos-alisg-v-2774/oUeCAfEfBp0MFDFgEQAoz5QDAE4agSAHJI0BEA.jpeg",
                            trend: "up",
                            url: "https://sf16-ies-music-sg.tiktokcdn.com/obj/tos-alisg-ve-2774/ee731b9e546a4511baa800e4bc456756"
                        ),
                        TrackModel(
                            title: "Monkeyshine-JP",
                            creator: "Lt FitzGibbons Men",
                            cover: "http://p77-sg.tiktokcdn.com/aweme/200x200/tiktok-obj/anthem_clip_cover.jpeg.jpeg",
                            trend: "up",
                            url: "https://sf16-ies-music-sg.tiktokcdn.com/obj/tos-alisg-ve-2774/3c2b16b99d77407f8c7cff1d1c477b2b"
                        )
                    ]
                ),
                CountryChart(
                    id: 2,
                    title: "USA",
                    pos: 4,
                    isPremium: true,
                    image: "https://media-backend.finanse.space/storage/setImages/r3PPAWiAaVxMfmzXVYTpOEbWxf3USRzf3g9W8umY.webp",
                    music: [
                        TrackModel(
                            title: "In The End - Mellen Gi Remix",
                            creator: "fleuriemusic",
                            cover: "http://p77-sg.tiktokcdn.com/aweme/200x200/tos-alisg-v-2774/oUeCAfEfBp0MFDFgEQAoz5QDAE4agSAHJI0BEA.jpeg",
                            trend: "up",
                            url: "https://sf16-ies-music-sg.tiktokcdn.com/obj/tos-alisg-ve-2774/ee731b9e546a4511baa800e4bc456756"
                        ),
                        TrackModel(
                            title: "Monkeyshine-JP",
                            creator: "Lt FitzGibbons Men",
                            cover: "http://p77-sg.tiktokcdn.com/aweme/200x200/tiktok-obj/anthem_clip_cover.jpeg.jpeg",
                            trend: "up",
                            url: "https://sf16-ies-music-sg.tiktokcdn.com/obj/tos-alisg-ve-2774/3c2b16b99d77407f8c7cff1d1c477b2b"
                        )
                    ]
                ),
                
                CountryChart(
                    id: 6,
                    title: "USA",
                    pos: 8,
                    isPremium: true,
                    image: "https://media-backend.finanse.space/storage/setImages/r3PPAWiAaVxMfmzXVYTpOEbWxf3USRzf3g9W8umY.webp",
                    music: [
                        TrackModel(
                            title: "In The End - Mellen Gi Remix",
                            creator: "fleuriemusic",
                            cover: "http://p77-sg.tiktokcdn.com/aweme/200x200/tos-alisg-v-2774/oUeCAfEfBp0MFDFgEQAoz5QDAE4agSAHJI0BEA.jpeg",
                            trend: "up",
                            url: "https://sf16-ies-music-sg.tiktokcdn.com/obj/tos-alisg-ve-2774/ee731b9e546a4511baa800e4bc456756"
                        ),
                        TrackModel(
                            title: "Monkeyshine-JP",
                            creator: "Lt FitzGibbons Men",
                            cover: "http://p77-sg.tiktokcdn.com/aweme/200x200/tiktok-obj/anthem_clip_cover.jpeg.jpeg",
                            trend: "up",
                            url: "https://sf16-ies-music-sg.tiktokcdn.com/obj/tos-alisg-ve-2774/3c2b16b99d77407f8c7cff1d1c477b2b"
                        )
                    ]
                ),
                
                CountryChart(
                    id: 26,
                    title: "USA",
                    pos: 8,
                    isPremium: true,
                    image: "https://media-backend.finanse.space/storage/setImages/r3PPAWiAaVxMfmzXVYTpOEbWxf3USRzf3g9W8umY.webp",
                    music: [
                        TrackModel(
                            title: "In The End - Mellen Gi Remix",
                            creator: "fleuriemusic",
                            cover: "http://p77-sg.tiktokcdn.com/aweme/200x200/tos-alisg-v-2774/oUeCAfEfBp0MFDFgEQAoz5QDAE4agSAHJI0BEA.jpeg",
                            trend: "up",
                            url: "https://sf16-ies-music-sg.tiktokcdn.com/obj/tos-alisg-ve-2774/ee731b9e546a4511baa800e4bc456756"
                        ),
                        TrackModel(
                            title: "Monkeyshine-JP",
                            creator: "Lt FitzGibbons Men",
                            cover: "http://p77-sg.tiktokcdn.com/aweme/200x200/tiktok-obj/anthem_clip_cover.jpeg.jpeg",
                            trend: "up",
                            url: "https://sf16-ies-music-sg.tiktokcdn.com/obj/tos-alisg-ve-2774/3c2b16b99d77407f8c7cff1d1c477b2b"
                        )
                    ]
                )
            ]
        )
    )
    .environment(NavigationViewModel())
}
