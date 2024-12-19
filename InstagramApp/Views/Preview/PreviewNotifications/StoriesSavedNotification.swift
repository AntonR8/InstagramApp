//
//  StoriesSavedNotification.swift
//  InstagramApp
//
//  Created by Антон Разгуляев on 26.11.2024.
//

import SwiftUI

struct StoriesSavedNotification: View {
    var storiesViewModel: StoriesViewModel

    var body: some View {
        CapsuleNotification(message: "Stories saved")
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now()+3) {
                    storiesViewModel.showStoriesSaved = false
                }
            }
    }
}

#Preview {
    StoriesSavedNotification(storiesViewModel: StoriesViewModel())
}
