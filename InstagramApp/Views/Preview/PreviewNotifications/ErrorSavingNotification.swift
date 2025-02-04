//
//  ErrorSavingNotification.swift
//  InstagramApp
//
//  Created by Антон Разгуляев on 22.11.2024.
//

import SwiftUI

struct ErrorSavingVideoNotification: View {
    var reelsViewModel: ReelsViewModel

    var body: some View {
        CapsuleNotification(message: "Error saving video", isErrorNotification: true)
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now()+3) {
                    reelsViewModel.showVideoNOTSaved = false
                }
            }

    }
}

#Preview {
    ErrorSavingVideoNotification(reelsViewModel: ReelsViewModel())
}
