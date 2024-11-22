import SwiftUI

struct ProButtonView: View {
    var title: String? = "PRO"

    var body: some View {
        HStack {
            Image(systemName: "crown.fill")
                .font(title != nil ? .caption : .headline)
            if let title {
                Text(title)
                    .bold()
            }

        }
        .padding(6)
        .padding(.horizontal, title != nil ? 6 : 0)
        .padding(.horizontal, title != nil ? 0 : -2)
        .foregroundStyle(.white)
        .background(
            ZStack {
                if title != nil {
                    RoundedRectangle(cornerRadius: 8)
                } else {
                    Capsule()
                }
            }
                .foregroundStyle(LinearGradient(colors: [Color(hex: 0xFFCB03),Color(hex: 0xFF0477),Color(hex: 0x7618FF)], startPoint: .leading, endPoint: .trailing))
        )
    }
}

#Preview {
    ProButtonView(title: nil)
}
