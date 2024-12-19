
import SwiftUI
import Photos
import Observation


@Observable
final class ReelsViewModel {
    var reelsArray: [ReelsFolderModel] {
        didSet { saveVideos() }
    }

    private var oldFolderName = ""
    var newFolderName = ""
    var showAddedToFolder = false
    var showCreateNewFolderAllert = false
    var showRenameFolderAllert = false
    var showSelectVideoFolders = false

    // notifications:
    var showTrackNameCopied = false
    var showProgressWhileSavingVideo = false
    var showAudioSavedToFiles = false
    var showVideoSaved = false
    var showVideoNOTSaved = false
    var showSavingAudio = false
    var showErrorSavingAudio = false
    var showTextCopied = false
    var showProgressWhileSavingImage = false
    var showImageSaved = false
    var showErrorSavingImage = false
    var showProgressWhileSavingStories = false
    var showStoriesSaved = false

    var reelsForAdd: ReelsModel?

    init () {
        let recents = ReelsFolderModel(reelsArray: [], name: "Recents")
        let saved = ReelsFolderModel(reelsArray: [], name: "Saved")
        self.reelsArray = [recents, saved]

        loadVideos()
        preFetchCovers()
    }

    // init:
    private func saveVideos() {
        if let encodedData = try? JSONEncoder().encode(reelsArray) {
            UserDefaults.standard.setValue(encodedData, forKey: "Reels")
        }
    }

    func loadVideos() {
        guard
            let videosData = UserDefaults.standard.data(forKey: "Reels"),
            let savedVideos = try? JSONDecoder().decode([ReelsFolderModel].self, from: videosData)
        else { return }
        self.reelsArray = savedVideos
    }

    private func preFetchCovers() {
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
    private func addFolder(folderName: String) {
        let newFolder = ReelsFolderModel(reelsArray: [], name: folderName)
        reelsArray.append(newFolder)
    }

    func deleteFolder(folderIndex: Int) {
        if reelsArray[safe: folderIndex] != nil {
            if reelsArray[folderIndex].name == "Recents" || reelsArray[folderIndex].name == "Saved" { return }
            reelsArray.remove(at: folderIndex)
        }
    }

    private func changeFolderName(from oldName: String, to newName: String) {
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

    func saveNewFolder() {
        addFolder(folderName: newFolderName)
        newFolderName  = ""
        showSelectVideoFolders = true
    }

    func saveRenamedVideoFolder() {
        changeFolderName(from: oldFolderName, to: newFolderName)
        newFolderName = ""
        oldFolderName = ""
        showRenameFolderAllert = false
    }

    func buttonSaveClipInFolderAction(selectedFolderIndex: Int) {
        if let reels = reelsForAdd {
            addReels(to: selectedFolderIndex, reelsForAdd: reels)
            showSelectVideoFolders = false
        } else { print("clipForAdd отсутствует, не выбран") }
    }

    // clips:
    private func addReels(to folderIndex: Int, reelsForAdd: ReelsModel) {
        if reelsArray[safe: folderIndex] != nil {
                reelsArray[folderIndex] = reelsArray[folderIndex].addClip(reels: reelsForAdd)
                    print("Клип \(reelsForAdd.description) в \(reelsArray[folderIndex].name) добавлен")
                    if !(reelsArray[folderIndex].name == "Recents") {
                showAddedToFolder = true
            }
        }
    }

    func addReels(to folderName: String, reelsForAdd: ReelsModel) {
        if let index = reelsArray.firstIndex(where: {$0.name == folderName}) {
            if reelsArray[index].reelsArray.last?.videoDownloadUrl != reelsForAdd.videoDownloadUrl {
                reelsArray[index] = reelsArray[index].addClip(reels: reelsForAdd)
                print("Клип \(reelsForAdd.description) в \(folderName) добавлен")
                if !(folderName == "Recents") {
                    showAddedToFolder = true
                }
            }
        } else {
            print("Ошибка добавления клипа")
        }
    }

   func removeReels(from folderName: String, reels: ReelsModel) {
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


    // download:
    func saveClipAudio(reelsData: ReelsModel?) {
        Task {
            if let audioDownloadURL = reelsData?.audioDownloadUrl {
                let mp3data = await DownloadManager().downloadTrack(trackurl: audioDownloadURL)
                if let mp3data {
                    DownloadManager().saveTrack(data: mp3data, name: reelsData?.audioTitle ?? "audio")
                } else { print("no mp3data") }
            }
        }
    }

    func getData(from videoURL: String) async -> Data? {
        let url = URL(string: videoURL)!
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            if let response = response as? HTTPURLResponse {
                if response.statusCode != 200 {
                    print("Ошибка загрузки данных HTTPURLResponse.statusCode: \(response.statusCode)")
                    if response.statusCode == 403 {
                        print("403 Forbidden («запрещено (не уполномочен)»)")
                    }
                    return nil
                } else {
                    print("Данные успешно скачены")
                }
            }
            return data
        } catch let error {
            print("Ошибка URLSession: \(error.localizedDescription)")
            return nil
        }
    }

    func getPath(fileName: String, fileExtension: String) -> URL? {
        guard
            let path = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first?
                .appendingPathComponent ("\(fileName).\(fileExtension)")
        else {
            print ("Error getting path.")
            return nil
        }
        return path
    }

    func saveDataToPath(data: Data, path: URL) {
        do {
            try data.write(to: path)
        } catch let error {
            print("Ошибка сохранения data в path: \(error.localizedDescription)")
        }

    }

    func saveVideoFromPathTpGallery(path: URL) {
        PHPhotoLibrary.shared().performChanges({
            PHAssetChangeRequest.creationRequestForAssetFromVideo(atFileURL: path)
        }) { completed, error in
            if completed {
                print("Видео успешно сохранено в Фотогалерею")
                DispatchQueue.main.async{
                    self.showProgressWhileSavingVideo = false
                    self.showVideoSaved = true
                    RestrictionsManager.shared.updateCounter()
                }
            }
            if let error {
                print("Ошибка сохранения видео в Фотогалерею: \(error)")
                self.showProgressWhileSavingVideo = false
                self.showVideoNOTSaved = true
            }
        }
    }

    func downloadAndSaveVideoToGallery(link: String) {
        showProgressWhileSavingVideo = true
        Task {
            if let data = await getData(from: link) {
                if let path = getPath(fileName: "tempFile", fileExtension: "mp4") {
                    saveDataToPath(data: data, path: path)
                    saveVideoFromPathTpGallery(path: path)
                } else {
                    print("Ошибка сохранения фото или видео в галлерею: - path отсутствует -")
                    showProgressWhileSavingVideo = false
                    self.showVideoNOTSaved = true
                }
            } else {
                print("Ошибка сохранения фото или видео в галлерею: - data отсутствует -")
                showProgressWhileSavingVideo = false
                self.showVideoNOTSaved = true
            }
        }
    }
}
