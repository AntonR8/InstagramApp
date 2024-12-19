
import SwiftUI

struct CoverView: View {
    let country: CountryChart
    var albumsViewModel: AlbumsViewModel

    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: country.image)) { image in
                if let image = image.image {
                    image
                        .resizable()
                        .scaledToFill()
                } else {
                    ProgressView()
                }
            }

            VStack {
                if albumsViewModel.showAddedToSavedAlert {
                    CapsuleNotification(message: "Added to “saved” tab")
                        .padding(.top, 80)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                withAnimation(.easeInOut) {
                                    albumsViewModel.showAddedToSavedAlert = false
                                }
                            }
                        }
                }
                Spacer()
                Text(country.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text("Top trends for TikTok")
                    .font(.subheadline)
                    .foregroundColor(.white)
            }
            .padding()
        }
        .frame(height: 390)
        Spacer()
    }
}

#Preview {
    CoverView(country: CountryChart(id: 2, title: "USA", pos: 1, isPremium: false, image: "https://media-backend.finanse.space/storage/setImages/r3PPAWiAaVxMfmzXVYTpOEbWxf3USRzf3g9W8umY.webp",
                        music: [
                            TrackModel(title: "In The End - Mellen Gi Remix", creator: "fleuriemusic", cover: "http://p77-sg.tiktokcdn.com/aweme/200x200/tos-alisg-v-2774/oUeCAfEfBp0MFDFgEQAoz5QDAE4agSAHJI0BEA.jpeg", trend: "up", url: "https://sf16-ies-music-sg.tiktokcdn.com/obj/tos-alisg-ve-2774/ee731b9e546a4511baa800e4bc456756"), TrackModel(title: "Monkeyshine-JP", creator: "Lt FitzGibbons Men", cover: "http://p77-sg.tiktokcdn.com/aweme/200x200/tiktok-obj/anthem_clip_cover.jpeg.jpeg", trend: "up", url: "https://sf16-ies-music-sg.tiktokcdn.com/obj/tos-alisg-ve-2774/3c2b16b99d77407f8c7cff1d1c477b2b")
                        ]), albumsViewModel: AlbumsViewModel())
}

