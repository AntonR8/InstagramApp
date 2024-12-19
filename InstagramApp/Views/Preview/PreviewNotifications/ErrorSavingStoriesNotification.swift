//
//  ErrorSavingStoriesNotification.swift
//  InstagramApp
//
//  Created by Антон Разгуляев on 05.12.2024.
//

import SwiftUI

struct ErrorSavingStoriesNotification: View {
    var storiesViewModel: StoriesViewModel

    var body: some View {
        CapsuleNotification(message: "Error, please try again", isErrorNotification: true)
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now()+3) {
                        storiesViewModel.showVideoNOTSaved = false
                }
            }

    }
}

#Preview {
    ErrorSavingStoriesNotification(storiesViewModel: StoriesViewModel())
}
