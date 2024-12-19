
import SwiftUI

struct SeeAllButton: View {
    let title = "See all"
    let rightIcon: String = "chevron.right"
    let destination: AnyView

    var body: some View {
        NavigationLink(destination: destination) {
            HStack {
                Text(title)
                    .font(.footnote)
                Image(systemName: rightIcon)
                    .font(.caption)
            }
            .foregroundStyle(.black)
            .padding(8)
            .padding(.horizontal, 4)
            .background(
                Capsule()
                    .fill(.clear)
                    .stroke(.gray.opacity(0.7), lineWidth: 1)
            )
            .padding(1)
        }
    }
}

#Preview {
    SeeAllButton(destination: AnyView(TrendsView()))
}
