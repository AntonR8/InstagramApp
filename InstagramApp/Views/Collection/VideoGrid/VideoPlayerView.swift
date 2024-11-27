

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    let url: String
    @State private var player: AVPlayer?

    var body: some View {
        VideoPlayer(player: player)
            .ignoresSafeArea()
            .onAppear {
                if let link = URL(string: url) {
                    player = AVPlayer(url: link)
                    player?.play()
                }
            }
    }
}

#Preview {
    VideoPlayerView(url: "https://scontent-waw2-2.cdninstagram.com/o1/v/t16/f1/m86/0B46D07F0C046A7FBAC3DCC4A375FD8B_video_dashinit.mp4?efg=eyJ4cHZfYXNzZXRfaWQiOjEyMjYwMzUxOTg0MjQ2ODQsInZlbmNvZGVfdGFnIjoieHB2X3Byb2dyZXNzaXZlLklOU1RBR1JBTS5DTElQUy5DMy43MjAuZGFzaF9iYXNlbGluZV8xX3YxIn0&_nc_ht=scontent-waw2-2.cdninstagram.com&_nc_cat=102&vs=9a838332cb6f771e&_nc_vs=HBksFQIYUmlnX3hwdl9yZWVsc19wZXJtYW5lbnRfc3JfcHJvZC8wQjQ2RDA3RjBDMDQ2QTdGQkFDM0RDQzRBMzc1RkQ4Ql92aWRlb19kYXNoaW5pdC5tcDQVAALIAQAVAhg6cGFzc3Rocm91Z2hfZXZlcnN0b3JlL0dCcENYUnVNQjFjVGhXNEZBRnk3ZlJPaXQ2UkticV9FQUFBRhUCAsgBACgAGAAbAogHdXNlX29pbAExEnByb2dyZXNzaXZlX3JlY2lwZQExFQAAJtjZ34fSxK0EFQIoAkMzLBdANsKPXCj1wxgSZGFzaF9iYXNlbGluZV8xX3YxEQB1_gcA&ccb=9-4&oh=00_AYBjLx7hwMLzgVazPn8n4UfqDg8FysCnPtOF1P0u-M-FxA&oe=67461CC0&_nc_sid=1d576d"/*mockReelsResponse.data.reels.videoDownloadURL*/) 
}

