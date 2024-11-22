//
//  MainView.swift
//  TikTokApp
//
//  Created by Антон Разгуляев on 16.10.2024.
//

import SwiftUI
import TipKit
import ApphudSDK

struct MainView: View {
    @State var mainViewModel = MainViewModel()
    @State var link = ""
    @State var showInstruction = false
    @Environment(\.requestReview) var requestReview

    var body: some View {
        NavigationStack(path: $mainViewModel.path) {
            ZStack {
                VStack {
                    Spacer()
                    TitleMainView()
                    LinkField(link: $link)
                    CapsuleButton(title: "Find", rightIcon: "arrow.forward") {
                        //                        mainViewModel.findButtonPushed(link: link)
                    }
                    .disabled(link.isEmpty)
                    .opacity(link.isEmpty ? 0.5 : 1)
                    ShowInstructionsButton(showInstruction: $showInstruction)
                    Spacer()
                    Spacer()
                }
                .padding()
                if mainViewModel.showDownloading {
                    DownloadingProgressView(mainViewModel: mainViewModel)
                }
            }
            .sheet(isPresented: $showInstruction) {
                Instruction(showInstruction: $showInstruction)
                    .presentationDetents([.height(480)])
            }
            .wrongLinkAllert(mainViewModel: mainViewModel, showInstruction: $showInstruction)
            .navigationDestination(for: String.self) { _ in
//                ClipPreView(paywallViewModel: paywallViewModel, mainViewModel: mainViewModel, tiktokLink: link, clipLink: link)
            }
        }
    }
}

#Preview {
    MainView()
}
