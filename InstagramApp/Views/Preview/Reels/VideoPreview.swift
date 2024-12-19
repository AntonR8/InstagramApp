
import SwiftUI
import SDWebImageSwiftUI

struct ReelsVideoPreview: View {
    let reels: ReelsModel
    let widthSize = UIScreen.main.bounds.width - 100

    var body: some View {
        NavigationLink {
            VideoPlayerView(url: reels.videoDownloadUrl)
        } label: {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.gray.opacity(0.1))
                .frame(width: widthSize, height: widthSize*16/9)
                .overlay {
                    WebImage(url: URL(string: reels.imagePreview)) { image in
                        image.resizable()
                    } placeholder: {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(.gray.opacity(0.001))
                    }
                    .indicator(.activity)
                    .scaledToFit()
                    .cornerRadius(25)
                }
        }
        .overlay(alignment: .bottomLeading) {
            ReelsClipInfo(reels: reels)
                .padding(.bottom)
                .padding(.leading, 8)
        }
        .overlay {
            NavigationLink {
                VideoPlayerView(url: reels.videoDownloadUrl)
            } label: {
                Image(systemName: "play.fill")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .padding()
                    .background(Color.gray)
                    .clipShape(Circle())
            }
        }
        .padding()
    }
}


#Preview {
    ReelsVideoPreview(reels: mockReelsResponse.data.reels)
}
