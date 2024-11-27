//
//  DataManager.swift
//  TikTokApp
//
//  Created by Антон Разгуляев on 30.10.2024.
//
import SwiftUI
import Photos
import Observation


@Observable
class ReelsViewModel {
    var reelsArray: [ReelsFolderModel] {
        didSet { saveVideos() }
    }

    var oldFolderName = ""
    var newFolderName = ""
    var showAddedToFolder = false
    var showCreateNewFolderAllert = false
    var showRenameFolderAllert = false
    var showSelectVideoFolders = false
    var reelsForAdd: ReelsModel?

    init () {
        let recents = ReelsFolderModel(reelsArray: [], name: "Recents")
        let saved = ReelsFolderModel(reelsArray: [], name: "Saved")
        self.reelsArray = [recents, saved]

        loadVideos()
        preFetchCovers()
    }

    // init:
    func saveVideos() {
        if let encodedData = try? JSONEncoder().encode(reelsArray) {
            UserDefaults.standard.setValue(encodedData, forKey: "videos")
        }
    }

    func loadVideos() {
        guard
            let videosData = UserDefaults.standard.data(forKey: "videos"),
            let savedVideos = try? JSONDecoder().decode([ReelsFolderModel].self, from: videosData)
        else { return }
        self.reelsArray = savedVideos
    }

   

    func preFetchCovers() {
        var urls: [String] = []
        for folder in reelsArray {
            for reels in folder.reelsArray {
                urls.append(reels.imagePreview)
            }
        }
        DispatchQueue.global().async {
            ImagePreFetcher.shared.startPrefetching(stringURLs: urls)
        }
    }

    // folders:
    func addFolder(folderName: String) {
        let newFolder = ReelsFolderModel(reelsArray: [], name: folderName)
        reelsArray.append(newFolder)
    }

    func deleteFolder(folderIndex: Int) {
        if reelsArray[safe: folderIndex] != nil {
            if reelsArray[folderIndex].name == "Recents" || reelsArray[folderIndex].name == "Saved" { return }
            reelsArray.remove(at: folderIndex)
        }
    }

    func changeFolderName(from oldName: String, to newName: String) {
        if let index = reelsArray.firstIndex(where: {$0.name == oldName}) {
            reelsArray[index] = reelsArray[index].changeName(newName: newName)
        }
    }

    func returnFolder(folderName: String) -> ReelsFolderModel? {
        reelsArray.first(where: {$0.name == folderName})
    }

    func renameFolderPressed(folderName: String) {
        showRenameFolderAllert = true
        newFolderName = folderName
        oldFolderName = folderName
    }

    func buttonSaveClipInFolderAction(selectedFolderIndex: Int) {
        if let reels = reelsForAdd {
            addClip(to: selectedFolderIndex, reels: reels)
            showSelectVideoFolders = false
        } else { print("clipForAdd отсутствует, не выбран") }
    }

    // clips:
    func addClip(to folderIndex: Int, reels: ReelsModel) {
        if reelsArray[safe: folderIndex] != nil {
            reelsArray[folderIndex] = reelsArray[folderIndex].addClip(reels: reels)
            print("Клип \(reels.description) в \(reelsArray[folderIndex].name) добавлен")
            if !(reelsArray[folderIndex].name == "Recents") {
                                showAddedToFolder = true
                            }
        }
    }

    func addClip(to folderName: String, reels: ReelsModel) {
        if let index = reelsArray.firstIndex(where: {$0.name == folderName}) {
            if reelsArray[index].reelsArray.last?.description != reels.description {
                reelsArray[index] = reelsArray[index].addClip(reels: reels)
                print("Клип \(reels.description) в \(folderName) добавлен")
                if !(folderName == "Recents") {
                    showAddedToFolder = true
                }
            }
        } else {
            print("Ошибка добавления клипа")
        }
    }

    func removeClip(from folderName: String, reels: ReelsModel) {
        if let index = reelsArray.firstIndex(where: {$0.name == folderName}) {
            reelsArray[index] = reelsArray[index].deleteClip(reels: reels)
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

    func returnRecentsFolder() -> ReelsFolderModel {
        guard
            let recentsFolder = reelsArray.first(where: {$0.name == "Recents"}),
            recentsFolder.reelsArray.count > 0
        else { return ReelsFolderModel(reelsArray: [], name: "Recents") }
        return recentsFolder
    }

    func createRecentFourClips() -> [ReelsModel] {
        guard
            let recentsFolder = reelsArray.first(where: {$0.name == "Recents"}),
            recentsFolder.reelsArray.count > 0
        else { return [] }

        var reelsArray: [ReelsModel] = []
        for i in 1...recentsFolder.reelsArray.count {
            let fetchedReels = recentsFolder.reelsArray[recentsFolder.reelsArray.count-i]
            reelsArray.append(fetchedReels)
        }
        return reelsArray
    }
}
