//
//  TrendsChartCover.swift
//  InstagramApp
//
//  Created by Антон Разгуляев on 22.11.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct TrendsChartCover: View {
    let imageName: String
    let width: CGFloat
    let height: CGFloat
    let countryTitle: String

    var body: some View {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.gray.opacity(0.2))
                .frame(width: width, height: height)
                .overlay {
                    WebImage(url: URL(string: imageName)) { image in
                            image.resizable()
                    } placeholder: { Rectangle().foregroundColor(.gray.opacity(0.1)) }
                        .indicator(.activity)
                        .frame(width: width, height: height)
                        .scaledToFill()
                        .cornerRadius(20)
                }
                .overlay {
                    VStack {
                        Spacer()
                        Text(countryTitle)
                            .font(.subheadline)
                            .foregroundStyle(.black)
                            .padding(8)
                            .frame(width: width, height: 64, alignment: .top)
                            .background(Color.lightGray)
                    }
                    .cornerRadius(20)
                }
    }
}

#Preview {
    ZStack {
        Color.red
        TrendsChartCover(imageName: "https://media-backend.finanse.space/storage/setImages/r3PPAWiAaVxMfmzXVYTpOEbWxf3USRzf3g9W8umY.webp",
                  width: 160,
                  height: 192,
                  countryTitle: "Россия")
    }
}
