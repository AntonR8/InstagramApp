//
//  InfoAndLegalSection.swift
//  TikTokApp
//
//  Created by Антон Разгуляев on 16.10.2024.
//

import SwiftUI

struct InfoAndLegalSection: View {


    var body: some View {
        Section(header: Text("Info & legal")) {
            Link(destination: Constants.FormalLinks.contactURL) {
                SettingsElementLabel(image: "envelope", title: "Contact us")
            }
            Link(destination: Constants.FormalLinks.privacyPolicyURL) {
                SettingsElementLabel(image: "person.badge.shield.checkmark", title: "Privacy Policy")
            }
            Link(destination: Constants.FormalLinks.termsOfUseURL) {
                SettingsElementLabel(image: "doc.text", title: "Usage Policy")
            }
        }
        .textCase(nil)
    }
}

#Preview {
    NavigationStack {
        SettingsView()
    }
}
