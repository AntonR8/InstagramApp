//
//  AuthorAndDescription.swift
//  InstagramApp
//
//  Created by Антон Разгуляев on 22.11.2024.
//

import SwiftUI

struct AuthorAndDescription: View {
    @State var hideDescription = true

    var body: some View {
        VStack(alignment: .leading) {
            Text("Ivan Ivanov")
                .fontWeight(.semibold)
                .padding(.vertical, 4)
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                .foregroundStyle(.black.opacity(0.8))
                .lineLimit(hideDescription ? 2 : .max)
            HStack {
                Spacer()
                Button {
                    hideDescription.toggle()
                } label: {
                    Text(hideDescription ? "More" : "Less")
                    Image(systemName: hideDescription ? "chevron.down" : "chevron.up")
                }
            }
            .padding(4)
        }
        .font(.footnote)
    }
}

#Preview {
    AuthorAndDescription()
}
