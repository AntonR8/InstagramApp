

import SwiftUI
import Photos
import Observation


@Observable
final class ProfilesViewModel {
    var profiles: [ProfileFolderModel] {
        didSet { saveProfiles() }
    }

    private var oldFolderName = ""
    var newFolderName = ""
    var showAddedToFolder = false
    var showCreateNewFolderAllert = false
    var showRenameFolderAllert = false
    var showSelectProfileFolders = false
    var profileForAdd: ProfileModel?

    // notifications:
    var showImageSaved = false
    var showTextCopied = false
    var showErrorSavingImage = false
    var showProgressWhileSavingImage = false

    init () {
        let recents = ProfileFolderModel(profilesArray: [], name: "Recents")
        let saved = ProfileFolderModel(profilesArray: [], name: "Saved")
        self.profiles = [recents, saved]

        loadProfiles()
        preFetchCovers()
    }

    // init:
    private func saveProfiles() {
        if let encodedData = try? JSONEncoder().encode(profiles) {
            UserDefaults.standard.setValue(encodedData, forKey: "profiles")
        }
    }

    func loadProfiles() {
        guard
            let profilesData = UserDefaults.standard.data(forKey: "profiles"),
            let savedProfiles = try? JSONDecoder().decode([ProfileFolderModel].self, from: profilesData)
        else { return }
        self.profiles = savedProfiles
    }

    private func preFetchCovers() {
        var urls: [String] = []
        for folder in profiles {
            for profile in folder.profilesArray {
                urls.append(profile.avatar)
            }
        }
        DispatchQueue.global().async {
            ImagePreFetcher.shared.startPrefetching(stringURLs: urls)
        }
    }

    // folders:
    private func addFolder(folderName: String) {
        let newFolder = ProfileFolderModel(profilesArray: [], name: folderName)
        profiles.append(newFolder)
    }

    func deleteFolder(folderIndex: Int) {
        if profiles[safe: folderIndex] != nil {
            if profiles[folderIndex].name == "Recents" || profiles[folderIndex].name == "Saved" { return }
            profiles.remove(at: folderIndex)
        }
    }

    private func changeFolderName() {
        if let index = profiles.firstIndex(where: {$0.name == oldFolderName}) {
            profiles[index] = profiles[index].changeName(newName: newFolderName)
        }
    }

    func returnFolder(folderName: String) -> ProfileFolderModel? {
        profiles.first(where: {$0.name == folderName})
    }

    func renameFolderPressed(folderName: String) {
        showRenameFolderAllert = true
        newFolderName = folderName
        oldFolderName = folderName
    }

    func saveNewFolder() {
        addFolder(folderName: newFolderName)
        newFolderName  = ""
        showSelectProfileFolders = true
    }

    func saveRenamedFolder() {
        changeFolderName()
        newFolderName = ""
        oldFolderName = ""
        showRenameFolderAllert = false
    }

    func buttonSaveProfileInFolderAction(selectedFolderIndex: Int) {
        if let profile = profileForAdd {
            addProfile(to: selectedFolderIndex, profile: profile)
            showSelectProfileFolders = false
        } else { print("profile отсутствует, не выбран") }
    }

    // clips:
    private func addProfile(to folderIndex: Int, profile: ProfileModel) {
        if profiles[safe: folderIndex] != nil {
            profiles[folderIndex] = profiles[folderIndex].addProfile(profile: profile)
            print("Профиль \(profile.name) в \(profiles[folderIndex].name) добавлен")
            if !(profiles[folderIndex].name == "Recents") {
                showAddedToFolder = true
            }
        }
    }

    func addProfile(to folderName: String, profileForAdd: ProfileModel) {
        if let index = profiles.firstIndex(where: {$0.name == folderName}) {
            if profiles[index].profilesArray.last?.avatar != profileForAdd.avatar {
                profiles[index] = profiles[index].addProfile(profile: profileForAdd)
                print("Профиль \(profileForAdd.description) в \(folderName) добавлен")
                if !(folderName == "Recents") {
                    showAddedToFolder = true
                }
            }
        } else {
            print("Ошибка добавления профиля")
        }
    }

   func removeProfile(from folderName: String, profile: ProfileModel) {
        if let index = profiles.firstIndex(where: {$0.name == folderName}) {
            profiles[index] = profiles[index].deleteProfile(profile: profile)
        }
    }


    // interface:
    func returnIcon(folderName: String) -> String {
        switch folderName {
        case "Saved": "bookmark"
        case "Recents": "clock.arrow.circlepath"
        default: "folder"
        }
    }

    func returnRecentsFolder() -> ProfileFolderModel {
        guard
            let recentsFolder = profiles.first(where: {$0.name == "Recents"}),
            recentsFolder.profilesArray.count > 0
        else { return ProfileFolderModel(profilesArray: [], name: "Recents") }
        return recentsFolder
    }

    func createRecentFourProfiles() -> [ProfileModel] {
        guard
            let recentsFolder = profiles.first(where: {$0.name == "Recents"}),
            recentsFolder.profilesArray.count > 0
        else { return [] }

        var profilesArray: [ProfileModel] = []
        for i in 1...recentsFolder.profilesArray.count {
            let fetchedProfiles = recentsFolder.profilesArray[recentsFolder.profilesArray.count-i]
            profilesArray.append(fetchedProfiles)
        }
        return profilesArray
    }

    // downloads:
    func saveImageToGallery(imageURL: String) async {
        if let url = URL(string: imageURL),
           let data = try? await URLSession.shared.data(from: url),
           let image = UIImage(data: data.0) {
                SaveToGalleryManager().saveImageToGallery(image)
        }
    }
}


