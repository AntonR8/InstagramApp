//
//  SettingsActionsView.swift
//  TikTokApp
//
//  Created by Антон Разгуляев on 15.10.2024.
//

import SwiftUI

struct SettingsActionsView: View {
    var settingsViewModel: SettingsViewModel
    @AppStorage("notofications") var notofications: Bool = false



    var body: some View {
        Section(header: Text("Actions")) {
            HStack {
                SettingsElementLabel(image: "bell.badge", title: "Notifications", showChevron: true)
                Spacer(minLength: 1)
                Toggle("", isOn: $notofications)
                    .toggleStyle(SwitchToggleStyle(tint: .accent))
                    .onChange(of: notofications) {
                        if let url = URL(string: UIApplication.openNotificationSettingsURLString) {
                                if UIApplication.shared.canOpenURL(url) {
                                    Task { await UIApplication.shared.open(url) }
                                }
                            }
                    }
            }

            SettingsButton(image: "trash", title: "Clear cache", action: {
                settingsViewModel.clearCache()
            }, description: settingsViewModel.cacheSize)

        }
        .onAppear {
            if !notofications {
                notofications = settingsViewModel.requestAuthorization()
            }
        }
        .textCase(nil)
    }


}

#Preview {
    NavigationStack {
        SettingsActionsView(settingsViewModel: SettingsViewModel())
    }
}
