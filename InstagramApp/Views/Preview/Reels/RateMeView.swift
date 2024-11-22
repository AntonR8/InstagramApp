//
//  RateMeView.swift
//  TikTokApp
//
//  Created by Антон Разгуляев on 16.10.2024.
//

import SwiftUI

struct RateMeView: View {

    @Environment(\.openURL) private var openURL
    var mainViewModel: MainViewModel

   private  func requestReviewManually() {
        let url = Constants.FormalLinks.requestReviewManuallyURL
        guard let writeReviewURL = URL(string: url) else {
            return
        }
        openURL(writeReviewURL)
    }
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
        VStack {
            HStack {
                Spacer()
                SmallImageButton(leftIcon: "xmark", foregroundStyle: .white, action: {
                    mainViewModel.showRateMeView = false
                })
                .padding()
            }
            Spacer()
            Image("rateme")   
                .resizable()
                .scaledToFit()
                .padding(.bottom, -16)
            Text("Do you like our app?")
                .font(.largeTitle)
                .bold()
            Text("Please rate our app so we can improve it for you and make it even cooler")
                .multilineTextAlignment(.center)
                .padding()
            VStack {
                CapsuleButton(leftIcon: "heart.fill", title: "Yes, I love it!") {
                    requestReviewManually()
                }
                
                CapsuleButton(title: "No, i don't", backgroundColor: .clear, foregroundColor: .accent) {
                    mainViewModel.showRateMeView = false
                }
            }
            .frame(maxWidth: 200)
            Spacer()
        }
    }
    }
}

#Preview {
    RateMeView(mainViewModel: MainViewModel())
}
