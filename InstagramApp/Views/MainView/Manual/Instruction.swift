//
//  Manual.swift
//  TikTokApp
//
//  Created by Антон Разгуляев on 17.10.2024.
//

import SwiftUI

struct Instruction: View {
    @State var page: Int = 1 {
        didSet {
            if page > 4 {
                showInstruction = false
            }
        }
    }
    @Binding var showInstruction: Bool

    func showNavPoints() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .black
        UIPageControl.appearance().pageIndicatorTintColor = .gray
    }

    var body: some View {
        VStack {
            HStack {
                Text("Instruction")
                    .font(.title3) 
                    .bold()
                Spacer()
                SmallImageButton(leftIcon: "xmark",foregroundStyle: .black.opacity(0.6)) {
                    showInstruction = false
                }
                .bold()
            }
            .padding()
            TabView(selection: $page) {
                InstructionTemplate(image: "first", title: "First step", text: "Open “Instagram” and find Reels, post or profile", page: $page)
                    .tag(1)
                InstructionTemplate(image: "second", title: "Second step", text: "Tap on share icon", page: $page)
                    .tag(2)
                InstructionTemplate(image: "third", title: "Third step", text: "Tap on “Copy link” icon", page: $page)
                    .tag(3)
                FourthSlide(image: "fourth", title: "Fourth step", text: "Open our app and paste the link", showInstruction: $showInstruction)
                    .tag(4)
            }
            .tabViewStyle(.page)
            .onAppear {
                showNavPoints()
            }
        }
        .background(.white)
    }
}

#Preview {
    ZStack {
        Color.gray
        Instruction(showInstruction: .constant(true))
            .frame(height: 480)
    }
}
