
import SwiftUI
import ApphudSDK

struct CardView: View {
    @Environment(NavigationViewModel.self) var navigationViewModel
    let chart: CountryChart
    let width: CGFloat
    let height: CGFloat

    var body: some View {
        NavigationLink {
            AlbumView(chart: chart)
        } label: {
            TrendsChartCover(
                imageName: chart.image,
                width: width,
                height: height,
                countryTitle: chart.title
            )
            .overlay(alignment: .topTrailing) {
                if !Apphud.hasPremiumAccess() {
                    if chart.isPremium {
                        ProButtonView(title: nil)
                            .padding(8)
                    }
                }
            }
        }
        .disabled(!Apphud.hasPremiumAccess() && chart.isPremium)
        .onTapGesture {
            if !Apphud.hasPremiumAccess() && chart.isPremium {
                navigationViewModel.showPaywall = true
            }
        }
    }
}


#Preview {
    NavigationStack {
        CardView( 
            chart: CountryChart(
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
                    )]
            ), width: 160, height: 192
        )
    }
    .environment(NavigationViewModel())

}
