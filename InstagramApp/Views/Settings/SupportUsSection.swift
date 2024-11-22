//
//  SettingsSupportUsView.swift
//  TikTokApp
//
//  Created by Антон Разгуляев on 16.10.2024.
//

import SwiftUI

struct SupportUsSection: View {
    @Environment(\.requestReview) var requestReview

    var body: some View {
        Section(header: Text("Support us")) {
            SettingsButton(image: "star", title: "Rate our app", action: { requestReview() }, description: nil)
            SettingsShareLink(shareLink: Constants.FormalLinks.appStoreLink, image: "square.and.arrow.up", title: "Share with friends")
        }
        .textCase(nil)
    }
}

#Preview {
    NavigationStack {
        SettingsView()
    }
}
