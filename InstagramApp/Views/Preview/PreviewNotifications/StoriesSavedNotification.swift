//
//  StoriesSavedNotification.swift
//  InstagramApp
//
//  Created by Антон Разгуляев on 26.11.2024.
//

import SwiftUI

struct StoriesSavedNotification: View {
    var mainViewModel: MainViewModel

    var body: some View {
        CapsuleNotification(message: "Stories saved")
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now()+3) {
                    mainViewModel.showStoriesSaved = false
                }
            }
    }
}

#Preview {
    StoriesSavedNotification(mainViewModel: MainViewModel())
}
