//
//  CapsuleNotification.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 13.09.2024.
//

import SwiftUI

struct CapsuleNotification: View {
    var message: String
    var isErrorNotification: Bool = false
    var isLoading: Bool = false

    var body: some View {
        HStack {
            if isLoading { ProgressView().controlSize(.mini).tint(.white) }
            else if isErrorNotification { Image(systemName: "xmark.circle.fill").foregroundStyle(.black, .red) }
            else { Image(systemName: "checkmark.circle.fill").foregroundStyle(.white, .green) }

            Text(message)
                .foregroundStyle(.white)
                .font(.caption)
                .padding(.trailing, 4)
        }
        .padding(8)
        .background(Color.primary)
        .clipShape( Capsule())
    }
}

#Preview {
    CapsuleNotification(message: "Take a photo")
}
