//
//  StartView.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 16.09.2024.
//

import SwiftUI

struct StartView: View {
    @AppStorage("firstRun") var firstRun = true
    @Environment(NavigationViewModel.self) var navigationViewModel

    var body: some View {
        ZStack {
            MainTabView()
            if firstRun {
                    FirstRunLaunchScreen()
            } else {
                LaunchScreen()
                    .opacity(navigationViewModel.launchScreenOpacity)
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    StartView()
        .environment(NavigationViewModel())
}