
import SwiftUI

struct TrendsSection: View {
    let section: SectionModel

    var body: some View {
        VStack {
            HStack {
                Text(section.title)
                    .font(.title3)
                    .bold()
                Spacer()
                SeeAllButton(destination: AnyView(OpenedSection(section: section))  )
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 16) {
                    ForEach (section.sets) { country in
                        CardView(chart: country, width: 160, height: 192)
                    }
                }
            }
            .padding(.bottom)
        }
    }
}

#Preview {
    NavigationStack {
        TrendsSection(
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
        .padding()
    }
    .environment(NavigationViewModel())
}
