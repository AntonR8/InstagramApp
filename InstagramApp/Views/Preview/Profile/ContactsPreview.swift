//
//  ContactsPreview.swift
//  InstagramApp
//
//  Created by Антон Разгуляев on 22.11.2024.
//

import SwiftUI

struct ContactsPreview: View {
    let contacts: [String]
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(contacts, id: \.self) { contact in
                Label(contact, systemImage: "link")
            }
        }
        .font(.caption)
    }
}

#Preview {
    ContactsPreview(contacts: ["youtu.be/oKhf382w?", "t.me/cosmosprosto"])
}
