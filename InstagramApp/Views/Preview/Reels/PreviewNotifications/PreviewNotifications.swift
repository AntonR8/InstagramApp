//
//  PreviewNotifications.swift
//  TikTokApp
//
//  Created by АнтохаПрограммист on 04.11.2024.
//

import SwiftUI

struct PreviewNotifications: View {
    
    var mainViewModel: MainViewModel
    var videosViewModel: VideosViewModel
    var body: some View {
        VStack {

            if videosViewModel.showAddedToFolder {
                AddedtoFolderNotification(videosViewModel: videosViewModel)
            }

            if mainViewModel.showTrackNameCopied {
                TrackNameCopiedNotification(mainViewModel: mainViewModel)
            }

            if mainViewModel.showSavingAudio {
                CapsuleNotification(message: "Saving audio from video", isLoading: true)
            }

            if mainViewModel.showAudioSavedToFiles {
                AudioSavedNotification(mainViewModel: mainViewModel)
            }

            if mainViewModel.showErrorSavingAudio {
                ErrorSavingAudioNotification(mainViewModel: mainViewModel)
            }

            if mainViewModel.showProgressViewWhileSaving {
                CapsuleNotification(message: "Saving video", isLoading: true)
            }


            if mainViewModel.showVideoSaved {
                VideoSavedNotification(mainViewModel: mainViewModel)
            }

            if mainViewModel.showVideoNOTSaved {
                ErrorSavingNotification(mainViewModel: mainViewModel)
            }
        }
        .padding(.top, 30)
    }
}

#Preview {
    PreviewNotifications(mainViewModel: MainViewModel(), videosViewModel: VideosViewModel())

}
