import SwiftUI

struct DownloadingProgressView: View {

    var mainViewModel: MainViewModel
//    @State var videosViewModel = VideosViewModel()

    func waitForDownloading() {
//            if let clipInfo = mainViewModel.clipInfo {
//                if !clipInfo.videoPreview.isEmpty {
//                    videosViewModel.addClip(to: "Recents", clip: clipInfo)
//                    mainViewModel.path.append("go")
//                } else {
//                    print("clipInfo.videoPreview.isEmpty и не добавлен в Recents")
//                    mainViewModel.showVPNLinkAlert = true
//                }
//            } else {
//                print("mainViewModel.clipInfo = nil")
//                mainViewModel.showVPNLinkAlert = true
//            }

    }

    var body: some View {
        ZStack {
            Color.black.opacity(0.3)
            ProgressView()
                .controlSize(.large)
                .padding()
                .background(
                    .ultraThinMaterial
                )
                .cornerRadius(10)
        }
        .onDisappear {
            waitForDownloading()
        }
    }
}

#Preview {
    DownloadingProgressView(mainViewModel: MainViewModel())
}
