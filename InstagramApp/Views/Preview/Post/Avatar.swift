//
//  Avatar.swift
//  InstagramApp
//
//  Created by Антон Разгуляев on 22.11.2024.
//

import SwiftUI

struct Avatar: View {
    var size: CGFloat = 36
    var body: some View {
        Image("paywall")
            .resizable()
            .scaledToFill()
            .clipShape(Circle())
            .frame(width: size, height: size)
    }
}

#Preview {
    Avatar()
}
