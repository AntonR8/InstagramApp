import SwiftUI
import SDWebImageSwiftUI

struct ReelsClipInfo: View {
    let reels: ReelsModel

    var body: some View {
        HStack(alignment: .top) {

            Circle()
                .fill(Color.gray.opacity(0.1))
                .frame(width: 36)
                .overlay {
                    WebImage(url: URL(string: reels.authorAvatar)) { image in
                        image.resizable()
                    } placeholder: { Circle().foregroundColor(.black) }
                        .indicator(.activity)
                        .scaledToFit()
                        .clipShape(Circle())
                }




            
            VStack(alignment: .leading) {
                Text(reels.author)
                    .font(.footnote)
                    .bold()
                    .lineLimit(1)
                Text(reels.description)
                    .font(.caption2)
                    .lineLimit(2)
                HStack {
                    Image(systemName: "music.note")
                        .foregroundStyle(.white)
                    Text(reels.audioTitle ?? "")
                        .font(.caption2)
                        .lineLimit(2)
                }
                .padding(6)
                .background(Color.black.opacity(0.3))
                .cornerRadius(6)
            }
            .padding(.top, 2)

        }
    }
}


#Preview {
    ReelsClipInfo(reels: mockReelsResponse.data.reels)
}
