//
//  videoPreview.swift
//  TikTokApp
//
//  Created by Антон Разгуляев on 17.10.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct ReelsVideoPreview: View {
    let reels: ReelsModel

    var body: some View {
        NavigationLink {
            VideoPlayerView(url: reels.videoDownloadURL)
        } label: {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.gray.opacity(0.1))
                .frame(width: 286, height: 508)
                .overlay {
                    WebImage(url: URL(string: reels.imagePreview)) { image in
                        image.resizable()
                    } placeholder: {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(.gray.opacity(0.001))
                    }
                    .indicator(.activity)
                    .scaledToFit()
                    .cornerRadius(25)
                }
        }
        .overlay(alignment: .bottom) {
            ReelsClipInfo(reels: reels)
                .padding(.bottom)
                .padding(.leading, 8)
        }
        .overlay {
            NavigationLink {
                VideoPlayerView(url: reels.videoDownloadURL)
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
    ReelsVideoPreview(reels: mockReelsResponse.data.reels)
}
