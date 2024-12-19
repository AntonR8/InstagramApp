//
//  StoriesVideoPreview.swift
//  InstagramApp
//
//  Created by Антон Разгуляев on 26.11.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct StoriesVideoPreview: View {
    let videoDownloadURL: String?
    let imagePreview: String?
    let authorAvatar: String?
    let author: String?
    let sinceStr: String?
    let widthSize = UIScreen.main.bounds.width - 100

    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.gray.opacity(0.1))
            .frame(width: widthSize, height: widthSize*16/9)
            .overlay {
                if let imagePreview {
                    WebImage(url: URL(string: imagePreview)) { image in
                        image.resizable()
                    } placeholder: {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(.gray.opacity(0.001))
                            .frame(width: widthSize, height: widthSize*16/9)
                    }
                    .indicator(.activity)
                    .scaledToFit()
                    .frame(width: widthSize, height: widthSize*16/9)
                    .cornerRadius(25)
                }
            }
            .overlay(alignment: .bottomLeading) {
                if let authorAvatar, let author, let sinceStr {
                    StoriesClipInfo(authorAvatar: authorAvatar, author: author, sinceStr: sinceStr)
                        .padding(12)
                }
            }
            .overlay {
                NavigationLink {
                    if let videoDownloadURL {
                        VideoPlayerView(url: videoDownloadURL)
                    }
                } label: {
                    Image(systemName: "play.fill")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .padding()
                        .background(Color.gray)
                        .clipShape(Circle())
                }
            }
            .padding()
    }
}


#Preview {
    StoriesVideoPreview(
        videoDownloadURL: mockStoriesResponse.data.story.videoDownloadUrl ?? "https://scontent-hou1-1.cdninstagram.com/o1/v/t16/f1/m78/314067CF303D2FA1478D6DC22AC855BA_video_dashinit.mp4?efg=eyJ4cHZfYXNzZXRfaWQiOjE5OTQ0NjIwNTQzNjUwMzYsInZlbmNvZGVfdGFnIjoieHB2X3Byb2dyZXNzaXZlLklOU1RBR1JBTS5TVE9SWS5DMy43MjAuZGFzaF9iYXNlbGluZV8xX3YxIn0&_nc_ht=scontent-hou1-1.cdninstagram.com&_nc_cat=102&vs=2729bced874c264&_nc_vs=HBksFQIYUWlnX3hwdl9wbGFjZW1lbnRfcGVybWFuZW50X3YyLzMxNDA2N0NGMzAzRDJGQTE0NzhENkRDMjJBQzg1NUJBX3ZpZGVvX2Rhc2hpbml0Lm1wNBUAAsgBABUCGDpwYXNzdGhyb3VnaF9ldmVyc3RvcmUvR0VybzZ4dkVOdjBuR2xFREFLQ2l3OUU3WjljUGJwa3dBQUFGFQICyAEAKAAYABsCiAd1c2Vfb2lsATEScHJvZ3Jlc3NpdmVfcmVjaXBlATEVAAAm2N2lpPz8igcVAigCQzMsF0Aw7tkWhysCGBJkYXNoX2Jhc2VsaW5lXzFfdjERAHXoBwA&ccb=9-4&oh=00_AYAbAQOeIeeG-yqrk0NloEECYJKMEKdK5dbUPHorYCkHfw&oe=67479AF8&_nc_sid=1d576d",
        imagePreview: mockStoriesResponse.data.story.imageDownloadUrl,
        authorAvatar: mockStoriesResponse.data.story.authorAvatar,
        author: mockStoriesResponse.data.story.author,
        sinceStr: mockStoriesResponse.data.story.sinceStr
    )
}
