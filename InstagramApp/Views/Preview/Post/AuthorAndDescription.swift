
import SwiftUI

struct AuthorAndDescription: View {
    @State var hideDescription = true
    let author: String?
    let description: String?
    var body: some View {
        VStack(alignment: .leading) {
            Text(author ?? "")
                .fontWeight(.semibold)
                .padding(.vertical, 4)
            Text(description ?? "")
                .foregroundStyle(.black.opacity(0.8))
                .lineLimit(hideDescription ? 2 : .max)
            HStack {
                Spacer()
                Button {
                    hideDescription.toggle()
                } label: {
                    Text(hideDescription ? "More" : "Less")
                    Image(systemName: hideDescription ? "chevron.down" : "chevron.up")
                }
            }
            .padding(4)
        }
        .font(.footnote)
    }
}

#Preview {
    AuthorAndDescription(author: mockPostResponse.data.post.author, description: mockPostResponse.data.post.description)
}
