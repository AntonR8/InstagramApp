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
class VideosViewModel {
    var videos: [VideoFolderModel] {
        didSet { saveVideos() }
    }

    var oldFolderName = ""
    var newFolderName = ""
    var showAddedToFolder = false
    var showCreateNewFolderAllert = false
    var showRenameFolderAllert = false
    var showSelectVideoFolders = false
    var clipForAdd: ClipInfoModel?
  
    init () {
        let recents = VideoFolderModel(clips: [], name: "Recents")
        let saved = VideoFolderModel(clips: [], name: "Saved")
        self.videos = [recents, saved]

        loadVideos()
        preFetchCovers()
    }

    // init:
    func saveVideos() {
        if let encodedData = try? JSONEncoder().encode(videos) {
            UserDefaults.standard.setValue(encodedData, forKey: "videos")
        }
    }

    func loadVideos() {
        guard
            let videosData = UserDefaults.standard.data(forKey: "videos"),
            let savedVideos = try? JSONDecoder().decode([VideoFolderModel].self, from: videosData)
        else { return }
        self.videos = savedVideos
    }

   

    func preFetchCovers() {
        var urls: [String] = []
        for folder in videos {
            for clip in folder.clips {
                urls.append(clip.videoPreview)
            }
        }
        DispatchQueue.global().async {
            ImagePreFetcher.shared.startPrefetching(stringURLs: urls)
        }
    }

    // folders:
    func addFolder(folderName: String) {
        let newFolder = VideoFolderModel(clips: [], name: folderName)
        videos.append(newFolder)
    }

    func deleteFolder(folderIndex: Int) {
        if videos[safe: folderIndex] != nil {
            if videos[folderIndex].name == "Recents" || videos[folderIndex].name == "Saved" { return }
            videos.remove(at: folderIndex)
        }
    }

    func changeFolderName(from oldName: String, to newName: String) {
        if let index = videos.firstIndex(where: {$0.name == oldName}) {
            videos[index] = videos[index].changeName(newName: newName)
        }
    }

    func returnFolder(folderName: String) -> VideoFolderModel? {
        videos.first(where: {$0.name == folderName})
    }

    func renameFolderPressed(folderName: String) {
        showRenameFolderAllert = true
        newFolderName = folderName
        oldFolderName = folderName
    }

    func buttonSaveClipInFolderAction(selectedFolderIndex: Int) {
        if let clip = clipForAdd {
            addClip(to: selectedFolderIndex, clip: clip)
            showSelectVideoFolders = false
        } else { print("clipForAdd отсутствует, не выбран") }
    }

    // clips:
    func addClip(to folderIndex: Int, clip: ClipInfoModel) {
        if videos[safe: folderIndex] != nil {
            videos[folderIndex] = videos[folderIndex].addClip(clip: clip)
            print("Клип \(clip.description) в \(videos[folderIndex].name) добавлен")
            if !(videos[folderIndex].name == "Recents") {
                                showAddedToFolder = true
                            }
        }
    }

    func addClip(to folderName: String, clip: ClipInfoModel) {
        if let index = videos.firstIndex(where: {$0.name == folderName}) {
            if videos[index].clips.last?.name != clip.name {
                videos[index] = videos[index].addClip(clip: clip)
                print("Клип \(clip.description) в \(folderName) добавлен")
                if !(folderName == "Recents") {
                    showAddedToFolder = true
                }
            }
        } else {
            print("Ошибка добавления клипа")
        }
    }

    func removeClip(from folderName: String, clip: ClipInfoModel) {
        if let index = videos.firstIndex(where: {$0.name == folderName}) {
            videos[index] = videos[index].deleteClip(clip: clip)
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

    func returnRecentsFolder() -> VideoFolderModel {
        guard
            let recentsFolder = videos.first(where: {$0.name == "Recents"}),
            recentsFolder.clips.count > 0
        else { return VideoFolderModel(clips: [], name: "Recents") }
        return recentsFolder
    }

    func createRecentFourClips() -> [ClipInfoModel] {
        guard
            let recentsFolder = videos.first(where: {$0.name == "Recents"}),
            recentsFolder.clips.count > 0
        else { return [] }

        var clips: [ClipInfoModel] = []
        for i in 1...recentsFolder.clips.count {
            let fetchedClip = recentsFolder.clips[recentsFolder.clips.count-i]
            clips.append(fetchedClip)
        }
        return clips
    }
}
