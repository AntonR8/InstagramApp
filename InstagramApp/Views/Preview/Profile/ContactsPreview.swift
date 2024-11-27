//
//  ContactsPreview.swift
//  InstagramApp
//
//  Created by Антон Разгуляев on 22.11.2024.
//

import SwiftUI

struct ContactsPreview: View {
    let biolinks: [BioLink]
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(biolinks, id: \.self) { biolink in
                if let link = URL(string: biolink.url) {
                    Link(destination: link) {
                        Label(biolink.url, systemImage: "link")
                    }
                }
            }
        }
        .font(.caption)
        .foregroundStyle(.black)
    }
}

#Preview {
    NavigationStack {
        ContactsPreview(biolinks: mockProfileResponse.data.profile.bioLinks)
    }
}
