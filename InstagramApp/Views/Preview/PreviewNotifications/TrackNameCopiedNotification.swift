//
//  TrackNameCopiedNotification.swift
//  InstagramApp
//
//  Created by Антон Разгуляев on 22.11.2024.
//

import SwiftUI

struct TrackNameCopiedNotification: View {
    var mainViewModel: MainViewModel
    var body: some View {
        CapsuleNotification(message: "Track name copied")
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now()+3) {
                    mainViewModel.showTrackNameCopied = false
                }
            }
    }
}

#Preview {
    TrackNameCopiedNotification(mainViewModel: MainViewModel())
}
