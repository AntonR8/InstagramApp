//
//  SettingsView.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 12.09.2024.
//

import SwiftUI
import ApphudSDK

struct SettingsView: View {
    @State var settingsViewModel = SettingsViewModel()

    var body: some View {
        List {
            if !Apphud.hasPremiumAccess() {
                SettingsPurchasesView()
            }
            SettingsActionsView(settingsViewModel: settingsViewModel)
            SupportUsSection()
            InfoAndLegalSection()
            AppVersionView()
        }
        .padding(.top, 1)
        .foregroundStyle(.primary)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        SettingsView()
    }
}
