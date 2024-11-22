//
//  PostImages.swift
//  InstagramApp
//
//  Created by Антон Разгуляев on 22.11.2024.
//

import SwiftUI

struct PostImages: View {
    let size = UIScreen.main.bounds.width - 32
    func showNavPoints() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .black
        UIPageControl.appearance().pageIndicatorTintColor = .gray
//        UIPageControl.appearance().preferredIndicatorImage = UIImage(systemName: "circle.fill")
        UIPageControl.appearance().hidesForSinglePage = true
        //        UIPageControl.appearance().setIndicatorImage(UIImage(systemName: "circle.fill", withConfiguration: UIImage.SymbolConfiguration(font: .systemFont(ofSize: 5))), forPage: 3)
    }

    var body: some View {
            TabView {
                ForEach(1..<6) { i in
                    Image("onboarding\(i)")
                        .resizable()
                        .scaledToFill()
                        .frame(width: size, height: size)
                        .clipped()
                        .cornerRadius(16)
                        .padding(8)
                }
        }
        .frame(maxWidth: .infinity, minHeight: UIScreen.main.bounds.width * 1.2)
        .tabViewStyle(.page)
        .onAppear {
            showNavPoints()
        }

    }
}

#Preview {
    PostImages()
}
