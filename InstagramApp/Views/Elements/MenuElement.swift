import SwiftUI

struct MenuElement: View {
    let icon: String
    let title: String
    var body: some View {
        VStack {
            Circle()
                .fill(.gray.opacity(0.2))
                .frame(width: 52)
                .overlay {
                    Image(systemName: icon)
                        .foregroundStyle(icon == "bookmark" ? .gray : .primary)
                }
            Text(title)
                .font(.caption2)
                .frame(width: 76)
                .multilineTextAlignment(.center)
        }
    }
}








#Preview {
    MenuElement(icon: "heart", title: "Test")
}

