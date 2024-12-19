
import SwiftUI

struct PreviewNotifications: View {
    var reelsViewModel: ReelsViewModel?
    var postsViewModel: PostsViewModel?
    var profilesViewModel: ProfilesViewModel?
    var storiesViewModel: StoriesViewModel?

    var body: some View {
        VStack {

            if let reelsViewModel {
                if reelsViewModel.showAddedToFolder {
                    AddedtoFolderNotification(reelsViewModel: reelsViewModel)
                }

                if reelsViewModel.showTrackNameCopied {
                    TrackNameCopiedNotification(reelsViewModel: reelsViewModel)
                }

                if reelsViewModel.showSavingAudio {
                    CapsuleNotification(message: "Saving audio from video", isLoading: true)
                }
                if reelsViewModel.showAudioSavedToFiles {
                    AudioSavedNotification(reelsViewModel: reelsViewModel)
                }

                if reelsViewModel.showErrorSavingAudio {
                    ErrorSavingAudioNotification(reelsViewModel: reelsViewModel)
                }

                if reelsViewModel.showProgressWhileSavingVideo {
                    CapsuleNotification(message: "Saving video", isLoading: true)
                }

                if reelsViewModel.showVideoSaved {
                    VideoSavedNotification(reelsViewModel: reelsViewModel)
                }

                if reelsViewModel.showVideoNOTSaved {
                    ErrorSavingVideoNotification(reelsViewModel: reelsViewModel)
                }
            }

            if let postsViewModel {
                if postsViewModel.showTextCopied {
                    TextCopiedNotification(postsViewModel: postsViewModel)
                }

                if postsViewModel.showProgressWhileSavingImage {
                    CapsuleNotification(message: "Saving image", isLoading: true)
                }

                if postsViewModel.showImageSaved {
                    ImageSavedNotification(postsViewModel: postsViewModel)
                }

                if postsViewModel.showErrorSavingImage {
                    ErrorSavingImageNotification(postsViewModel: postsViewModel)
                }

                if postsViewModel.showProgressWhileSavingImages {
                    CapsuleNotification(message: "Saving images", isLoading: true)
                }

                if postsViewModel.showImagesSaved {
                    ImagesSavedNotification(postsViewModel: postsViewModel)
                }
            }

            if let profilesViewModel {
                if profilesViewModel.showTextCopied {
                    TextCopiedNotification(profilesViewModel: profilesViewModel)
                }

                if profilesViewModel.showProgressWhileSavingImage {
                    CapsuleNotification(message: "Saving image", isLoading: true)
                }

                if profilesViewModel.showImageSaved {
                    ImageSavedNotification(profilesViewModel: profilesViewModel)
                }

                if profilesViewModel.showErrorSavingImage {
                    ErrorSavingImageNotification(profilesViewModel: profilesViewModel)
                }
            }

            if let storiesViewModel {

                if storiesViewModel.showProgressWhileSavingStories {
                    CapsuleNotification(message: "Saving stories", isLoading: true)
                }

                if storiesViewModel.showStoriesSaved {
                    StoriesSavedNotification(storiesViewModel: storiesViewModel)
                }

                if storiesViewModel.showVideoNOTSaved {
                    ErrorSavingStoriesNotification(storiesViewModel: storiesViewModel)
                }
            }


        }
        .padding(.top, 30)
    }
}

#Preview {
    PreviewNotifications(reelsViewModel: ReelsViewModel())
}
