
import SwiftUI
import SDWebImageSwiftUI

struct PostVideoPreview: View {
    let imagePreview: String
    let videoPreview: String
    let size = UIScreen.main.bounds.width - 32

    var body: some View {
        RoundedRectangle(cornerRadius: 16)
            .fill(Color.gray.opacity(0.1))
            .frame(width: size, height: size)
            .overlay {
                WebImage(url: URL(string: imagePreview)) { image in
                    image.resizable()
                } placeholder: {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(.gray.opacity(0.001))
                }
                .indicator(.activity)
                .scaledToFill()
                .frame(width: size, height: size)
                .cornerRadius(25)
            }
            .overlay {
                NavigationLink {
                    VideoPlayerView(url: videoPreview)
                } label: {
                    Image(systemName: "play.fill")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .padding()
                        .background(Color.gray)
                        .clipShape(Circle())
                }
            }
            .padding(8)
    }
}


#Preview {
    PostVideoPreview(imagePreview: "https://scontent-fra5-2.cdninstagram.com/v/t51.2885-15/347855775_1955331188154150_66255499721469448_n.jpg?stp=dst-jpg_e15_p480x480&efg=eyJ2ZW5jb2RlX3RhZyI6ImltYWdlX3VybGdlbi43MjB4OTAwLnNkci5mMzYzMjkuZGVmYXVsdF9jb3Zlcl9mcmFtZSJ9&_nc_ht=scontent-fra5-2.cdninstagram.com&_nc_cat=106&_nc_ohc=7uODe4bA3AoQ7kNvgHieXUC&_nc_gid=72c4b9ddc5b449c0aa2dfe4099bb9617&edm=ALQROFkBAAAA&ccb=7-5&ig_cache_key=MzEwNjY0NTc0NzQzOTc5NjYxNA%3D%3D.3-ccb7-5&oh=00_AYABsy5Hzex5skIpXrizp5_Zfdex9FUpPwq2v-osrzzzKg&oe=67537FF8&_nc_sid=fc8dfb", videoPreview: "https://scontent-fra3-2.cdninstagram.com/o1/v/t16/f2/m69/AQPopb2YM8I7GOPz9GWsbrH5vg-xM02CrGaX1qjTPeLB8sy81i4-8wEYnXIyrzNEVguDUnv7WI0Za3i7JPSHc7lO.mp4?efg=eyJ4cHZfYXNzZXRfaWQiOjI2NDk3NTQyOTM5OTI0OSwidmVuY29kZV90YWciOiJ4cHZfcHJvZ3Jlc3NpdmUuSU5TVEFHUkFNLkNBUk9VU0VMX0lURU0uQzMuNzIwLmRhc2hfYmFzZWxpbmVfMV92MSJ9&_nc_ht=scontent-fra3-2.cdninstagram.com&_nc_cat=103&strext=1&vs=f7ab586235d91329&_nc_vs=HBksFQIYOnBhc3N0aHJvdWdoX2V2ZXJzdG9yZS9HR1NjYnhReDJuWmE1M2tDQU9yc3VVZXVuSmdEYmtZTEFBQUYVAALIAQAVAhg6cGFzc3Rocm91Z2hfZXZlcnN0b3JlL0dDUG1yeFE5QVROdW1IUUNBRkptOWRlSzNnSUJia1lMQUFBRhUCAsgBACgAGAAbAogHdXNlX29pbAExEnByb2dyZXNzaXZlX3JlY2lwZQExFQAAJqLLv-XMv3gVAigCQzMsF0AZ3S8an753GBJkYXNoX2Jhc2VsaW5lXzFfdjERAHXuBwA&ccb=9-4&oh=00_AYBnahV7-OsNL_wItdXQPO8ttAQAK0A1TuH9nhxq9EVSkg&oe=674F6938&_nc_sid=1d576d")
}
