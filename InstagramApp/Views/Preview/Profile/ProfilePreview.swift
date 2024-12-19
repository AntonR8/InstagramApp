//
//  ProfilePewview.swift
//  InstagramApp
//
//  Created by Антон Разгуляев on 22.11.2024.
//

import SwiftUI
import ApphudSDK

struct ProfilePreview: View {
    @State var profilesViewModel = ProfilesViewModel()
    @Environment(NavigationViewModel.self) var navigationViewModel
    let profile: ProfileModel

    var body: some View {
        @Bindable var navigationViewModel = navigationViewModel
        VStack {
            ScrollView {
                VStack(alignment: .leading) {
                    HStack {
                        Avatar(avatarURL: profile.avatar, size: 80)
                        ProfileMetrics(publications: profile.totalPublications, subscribers: profile.totalSubscribers, subscriptions: profile.totalSubscriptions)
                    }
                    AuthorAndDescription(author: profile.name, description: profile.description)
                    ContactsPreview(biolinks: profile.bioLinks)
                }
            }
                Spacer()
            ProfileMenuButtons(profilesViewModel: profilesViewModel, profile: profile, link: profile.requestedUrl)
            CapsuleButton(title: "Save profile avatar") {
                Task {
                    await profilesViewModel.saveImageToGallery(imageURL: profile.avatar)
                    
                }
                profilesViewModel.showImageSaved = true
            }
                    .padding(.top)
        }
        .onAppear{
            profilesViewModel.loadProfiles()
            profilesViewModel.addProfile(to: "Recents", profileForAdd: profile) 
        }
        .overlay(alignment: .top) {
            PreviewNotifications(profilesViewModel: profilesViewModel)
        }
        .padding()
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
        if !Apphud.hasPremiumAccess() {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        navigationViewModel.showPaywall = true
                    } label: {
                        ProButtonView()
                    }
                }
            }
        }
        .sheet(isPresented: $profilesViewModel.showSelectProfileFolders) {
            SelectProfilesFolder(profilesViewModel: profilesViewModel)
                .presentationDetents([.medium])
        }
        .popover(isPresented: $navigationViewModel.showRateMeView, content: {
            RateMeView()
        })
        .newProfileFolderAllert(profilesViewModel: profilesViewModel)
    }
}

#Preview {
    NavigationStack {
        ProfilePreview(profile: mockProfileResponse.data.profile)
            .environment(NavigationViewModel())
    }
}
