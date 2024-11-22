//
//  DotsNavigationView.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 13.09.2024.
//

import SwiftUI

struct DotsNavigationView: View {
    let number: Int
    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: "circle.fill")
                .foregroundStyle(number == 1 ? .black : .gray)
            Image(systemName: "circle.fill")
            .foregroundStyle(number == 2 ? .black : .gray)
            Image(systemName: "circle.fill")
            .foregroundStyle(number == 3 ? .black : .gray)
            Image(systemName: "circle.fill")
            .foregroundStyle(number == 4 ? .black : .gray)
        }
        .font(.system(size: 8))
        .padding(8)
    }
}

#Preview {
    DotsNavigationView(number: 2)
}
