//
//  ToolbarProPaywallButton.swift
//  InstagramApp
//
//  Created by Антон Разгуляев on 26.11.2024.
//

import SwiftUI

struct ToolbarProPaywallButton: View {
    @Environment(NavigationViewModel.self) var navigationViewModel
    
    var body: some View {
        Button {
            navigationViewModel.showPaywall = true
        } label: {
            ProButtonView()
        }
    }
}

#Preview {
    ToolbarProPaywallButton()
        .environment(NavigationViewModel())
}
