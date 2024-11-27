//
//  StoriesClipInfo.swift
//  InstagramApp
//
//  Created by Антон Разгуляев on 26.11.2024.
//

import SwiftUI
import SDWebImageSwiftUI


struct StoriesClipInfo: View {
    let authorAvatar: String
    let author: String
    let sinceStr: String

    var body: some View {
        HStack(alignment: .center) {
            Circle()
                .fill(Color.gray.opacity(0.1))
                .frame(width: 36)
                .overlay {
                    WebImage(url: URL(string: authorAvatar)) { image in
                        image.resizable()
                    } placeholder: { Circle().foregroundColor(.black) }
                        .indicator(.activity)
                        .scaledToFit()
                        .clipShape(Circle())
                }
                Text(author)
                    .font(.footnote)
                    .bold()
                    .lineLimit(1)
                Text(sinceStr)
                    .font(.caption2)
                    .lineLimit(1)

        }
        .foregroundStyle(.white)
    }
}


#Preview {
    StoriesClipInfo(
        authorAvatar: mockStoriesResponse.data.stories.authorAvatar,
        author: mockStoriesResponse.data.stories.author,
        sinceStr: mockStoriesResponse.data.stories.sinceStr
    )
}