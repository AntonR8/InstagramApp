
import SwiftUI

struct ProfileMetrics: View {
    let publications: Int
    let subscribers: Int
    let subscriptions: Int

    var body: some View {
        HStack {
            VStack {
                Text(publications.description)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text("publications")
                    .font(.caption2)
                    .foregroundStyle(.primary.opacity(0.8))
            }
            Spacer()
            VStack {
                Text(subscribers.formatted().description)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text("subscribers")
                    .font(.caption2)
                    .foregroundStyle(.primary.opacity(0.8))
            }
            Spacer()
            VStack {
                Text(subscriptions.description)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text("subscriptions")
                    .font(.caption2)
                    .foregroundStyle(.primary.opacity(0.8))
            }
        }
        .padding()
    }
}

#Preview {
    ProfileMetrics(publications: 836, subscribers: 2566, subscriptions: 218)
}
