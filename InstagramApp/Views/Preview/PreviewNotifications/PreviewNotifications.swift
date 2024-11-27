//
//  PreviewNotifications.swift
//  TikTokApp
//
//  Created by АнтохаПрограммист on 04.11.2024.
//

import SwiftUI

struct PreviewNotifications: View {
    
    var mainViewModel: MainViewModel
    var reelsViewModel: ReelsViewModel
    var body: some View {
        VStack {

            if reelsViewModel.showAddedToFolder {
                AddedtoFolderNotification(reelsViewModel: reelsViewModel)
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

            if mainViewModel.showProgressWhileSavingVideo {
                CapsuleNotification(message: "Saving video", isLoading: true)
            }

            if mainViewModel.showVideoSaved {
                VideoSavedNotification(mainViewModel: mainViewModel)
            }

            if mainViewModel.showVideoNOTSaved {
                ErrorSavingVideoNotification(mainViewModel: mainViewModel)
            }

            if mainViewModel.showTextCopied {
                TextCopiedNotification(mainViewModel: mainViewModel)
            }

            if mainViewModel.showProgressWhileSavingImage {
                CapsuleNotification(message: "Saving image", isLoading: true)
            }

            if mainViewModel.showImageSaved {
                ImageSavedNotification(mainViewModel: mainViewModel)
            }

            if mainViewModel.showErrorSavingImage {
                ErrorSavingImageNotification(mainViewModel: mainViewModel)
            }

            if mainViewModel.showProgressWhileSavingStories {
                CapsuleNotification(message: "Saving stories", isLoading: true)
            }

            if mainViewModel.showStoriesSaved {

            }

        }
        .padding(.top, 30)
    }
}

#Preview {
    PreviewNotifications(mainViewModel: MainViewModel(), reelsViewModel: ReelsViewModel())
}
