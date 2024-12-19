import SwiftUI

struct DownloadingProgressView: View {
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
        .ignoresSafeArea()
    }


}

#Preview {
    DownloadingProgressView()
}

