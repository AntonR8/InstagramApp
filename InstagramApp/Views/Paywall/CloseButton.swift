
import SwiftUI

struct CloseButton: View {
    @Environment(NavigationViewModel.self) var navigationViewModel
    
    var body: some View {
        HStack {
            Button(action: {
                navigationViewModel.showPaywall = false
            }) {
                Image(systemName: "xmark")
                    .font(.callout)
                    .foregroundStyle(.gray)
            }
            .padding(10)
            .background(
                Circle()
                    .fill(.white.opacity(0.001))
                    .stroke(.gray.opacity(0.7), lineWidth: 0.5)
            )
            .padding(1)
            Spacer()
        }
    }
}

#Preview {
    CloseButton()
        .environment(NavigationViewModel())
}
