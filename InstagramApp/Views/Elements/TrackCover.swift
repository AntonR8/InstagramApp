//
//  TrackCover.swift
//  SaveTik
//
//  Created by АнтохаПрограммист on 17.11.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct TrackCover: View {
    let trackCoverURL: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 5)
            .fill(Color.gray.opacity(0.2))
            .frame(width: 40, height: 40)
            .overlay {
                WebImage(url: URL(string: "https" + trackCoverURL.dropFirst(4))) { image in
                        image.resizable()
                } placeholder: {
                    Rectangle()
                        .foregroundColor(.gray)
                        .overlay{ Image(systemName: "music.note") }
                }
                    .indicator(.activity)
                    .scaledToFit()
                    .cornerRadius(5)
            }
    }
}

#Preview {
    TrackCover(trackCoverURL: "http://p77-sg.tiktokcdn.com/aweme/200x200/tos-alisg-v-2774/oUeCAfEfBp0MFDFgEQAoz5QDAE4agSAHJI0BEA.jpeg")
}
