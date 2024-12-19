//
//  TrackNameCopiedNotification.swift
//  InstagramApp
//
//  Created by Антон Разгуляев on 22.11.2024.
//

import SwiftUI

struct TrackNameCopiedNotification: View {
    var reelsViewModel: ReelsViewModel
    var body: some View {
        CapsuleNotification(message: "Track name copied")
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now()+3) {
                    reelsViewModel.showTrackNameCopied = false
                }
            }
    }
}

#Preview {
    TrackNameCopiedNotification(reelsViewModel: ReelsViewModel())
}
