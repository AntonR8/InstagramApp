
import SwiftUI
import Photos
import Observation

struct StoriesFolderModel: Codable, Hashable {
    var storiesArray: [StoriesModel]
    var profileStoriesArray: [ProfileStoriesModel]
    let name: String

    func addStories(_ stories: StoriesModel) -> StoriesFolderModel {
        var instanceStories: [StoriesModel] = storiesArray
        instanceStories.append(stories)
        return StoriesFolderModel(storiesArray: instanceStories, profileStoriesArray: profileStoriesArray, name: name)
    }

    func addStories(_ profileStories: ProfileStoriesModel) -> StoriesFolderModel {
        var instanceProfileStories: [ProfileStoriesModel] = profileStoriesArray
        instanceProfileStories.append(profileStories)
        return StoriesFolderModel(storiesArray: storiesArray, profileStoriesArray: instanceProfileStories, name: name)
    }

    func deleteStories(_ stories: StoriesModel) -> StoriesFolderModel {
        var instanceStories: [StoriesModel] = storiesArray
        if let index = instanceStories.firstIndex(where: {$0.imageDownloadUrl == stories.imageDownloadUrl}) {
            instanceStories.remove(at: index)
        }
        return StoriesFolderModel(storiesArray: instanceStories, profileStoriesArray: profileStoriesArray, name: name)
    }

    func deleteStories(_ profileStories: ProfileStoriesModel) -> StoriesFolderModel {
        var instanceProfileStories: [ProfileStoriesModel] = profileStoriesArray
        if let index = instanceProfileStories.firstIndex(where: {$0.imageDownloadUrl == profileStories.imageDownloadUrl}) {
            instanceProfileStories.remove(at: index)
        }
        return StoriesFolderModel(storiesArray: storiesArray, profileStoriesArray: instanceProfileStories, name: name)
    }

    func changeName(newName: String) -> StoriesFolderModel {
        return StoriesFolderModel(storiesArray: storiesArray, profileStoriesArray: profileStoriesArray, name: newName)
    }
}


@Observable
final class StoriesViewModel {
    let foldersManager = FoldersManager()

    var stories: [StoriesFolderModel] {
        didSet { foldersManager.saveFolders(stories, forKey: "stories") }
    }

    private var oldFolderName = ""
    var newFolderName = ""
    var showCreateNewFolderAllert = false
    var showRenameFolderAllert = false
    var showSelectStoriesFolders = false
    var storiesForAdd: StoriesModel?
    var profileStoriesForAdd: [ProfileStoriesModel] = []


    // notifications:
    var showProgressWhileSavingStories = false
    var showStoriesSaved = false
    var showVideoNOTSaved = false
    var showAddedToFolder = false
    var showErrorSavingStories = false

    init () {
        let storiesRecents = StoriesFolderModel(storiesArray: [], profileStoriesArray: [], name: "Recents")
        let storiesSaved = StoriesFolderModel(storiesArray: [], profileStoriesArray: [], name: "Saved")
        self.stories = [storiesRecents, storiesSaved]

        loadStories()
        preFetchCovers()
    }

    // init:
    func loadStories() {
        if let stories = foldersManager.loadData(forKey: "stories", type: [StoriesFolderModel].self) {
            self.stories = stories
        }
    }

    private func preFetchCovers() {
        var urls: [String] = []
        for folder in stories {
            for storiesArray in folder.storiesArray {
                if let imageDownloadUrl = storiesArray.imageDownloadUrl {
                    urls.append(imageDownloadUrl)
                }
            }
            for profileStoriesArray in folder.profileStoriesArray {
                urls.append(profileStoriesArray.imageDownloadUrl)
            }
        }
        DispatchQueue.global().async {
            ImagePreFetcher.shared.startPrefetching(stringURLs: urls)
        }
    }

    // folders:
    private func addFolder() {
        let newFolder = StoriesFolderModel(storiesArray: [], profileStoriesArray: [], name: newFolderName)
        stories.append(newFolder)
    }

    func deleteFolder(folderIndex: Int) {
        if stories[safe: folderIndex] != nil {
            if stories[folderIndex].name == "Recents" || stories[folderIndex].name == "Saved" { return }
            stories.remove(at: folderIndex)
        }
    }

    private func changeFolderName() {
        if let index = stories.firstIndex(where: {$0.name == oldFolderName}) {
            stories[index] = stories[index].changeName(newName: newFolderName)
        }
    }

    func returnFolder(folderName: String) -> StoriesFolderModel? {
        stories.first(where: {$0.name == folderName})
    }

    func renameFolderPressed(folderName: String) {
        showRenameFolderAllert = true
        newFolderName = folderName
        oldFolderName = folderName
    }

    func saveNewFolder() {
        addFolder()
        newFolderName  = ""
        showSelectStoriesFolders = true
    }

    func saveRenamedVideoFolder() {
        changeFolderName()
        newFolderName = ""
        oldFolderName = ""
        showRenameFolderAllert = false
    }

    func buttonSaveStoriesInFolderAction(selectedFolderIndex: Int) {
        if let storiesForAdd {
            addStories(to: selectedFolderIndex, storiesForAdd: storiesForAdd)
            showSelectStoriesFolders = false
        } else { print("stories отсутствует, не выбран") }
    }

    // stories:
    private func addStories(to folderIndex: Int, storiesForAdd: StoriesModel) {
        if stories[safe: folderIndex] != nil {
            stories[folderIndex] = stories[folderIndex].addStories(storiesForAdd)
            print("Сторис \(stories.description) в \(stories[folderIndex].name) добавлен")
            if !(stories[folderIndex].name == "Recents") {
                showAddedToFolder = true
            }
        }
    }

    func addStories(to folderName: String, storiesForAdd: StoriesModel) {
        if let index = stories.firstIndex(where: {$0.name == folderName}) {
            if stories[index].storiesArray.last?.imageDownloadUrl != storiesForAdd.imageDownloadUrl {
                stories[index] = stories[index].addStories(storiesForAdd)
                print("Сторис в \(folderName) добавлен")
                if !(folderName == "Recents") {
                    showAddedToFolder = true
                }
            }
        } else {
            print("Ошибка добавления профиля")
        }
    }

    private func addStories(to folderIndex: Int, storiesForAdd: ProfileStoriesModel) {
        if stories[safe: folderIndex] != nil {
            stories[folderIndex] = stories[folderIndex].addStories(storiesForAdd)
            print("Сторис \(stories.description) в \(stories[folderIndex].name) добавлен")
            if !(stories[folderIndex].name == "Recents") {
                showAddedToFolder = true
            }
        }
    }

    func addStories(to folderName: String, storiesForAdd: [ProfileStoriesModel]) {
        if let index = stories.firstIndex(where: {$0.name == folderName}) {
            for profileStoryForAdd in storiesForAdd {
                if !stories[index].profileStoriesArray.contains(profileStoryForAdd) {
                    stories[index].profileStoriesArray.append(profileStoryForAdd)
                    print("Сторис в \(folderName) добавлен")
                    if !(folderName == "Recents") {
                        showAddedToFolder = true
                    }
                }
            }
        } else {
            print("Ошибка добавления профиля")
        }
    }

   func removeStories(from folderName: String, storiesForRemove: StoriesModel) {
        if let index = stories.firstIndex(where: {$0.name == folderName}) {
            stories[index] = stories[index].deleteStories(storiesForRemove)
        }
    }

    func removeStories(from folderName: String, storiesForRemove: ProfileStoriesModel) {
         if let index = stories.firstIndex(where: {$0.name == folderName}) {
             stories[index] = stories[index].deleteStories(storiesForRemove)
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

    func returnRecentsFolder() -> StoriesFolderModel {
        guard
            let recentsFolder = stories.first(where: {$0.name == "Recents"}),
            recentsFolder.storiesArray.count > 0
        else { return StoriesFolderModel(storiesArray: [], profileStoriesArray: [], name: "Recents") }
        return recentsFolder
    }

    func createRecentFourClips() -> [StoriesModel] {
        guard
            let recentsFolder = stories.first(where: {$0.name == "Recents"}),
            recentsFolder.storiesArray.count > 0 || recentsFolder.profileStoriesArray.count > 0
        else { return [] }

        var storiesArray: [StoriesModel] = []
        for i in 1...recentsFolder.storiesArray.count {
            let fetchedStories = recentsFolder.storiesArray[recentsFolder.storiesArray.count-i]
            storiesArray.append(fetchedStories)
        }
        return storiesArray
    }

    // downloads:
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
                    self.showProgressWhileSavingStories = false
                    self.showStoriesSaved = true
                    RestrictionsManager.shared.updateCounter()
                }
            }
            if let error {
                print("Ошибка сохранения видео в Фотогалерею: \(error)")
                self.showProgressWhileSavingStories = false
                self.showVideoNOTSaved = true
            }
        }
    }

    func downloadAndSaveVideoToGallery(link: String) {
        showProgressWhileSavingStories = true
        Task {
            if let data = await getData(from: link) {
                if let path = getPath(fileName: "tempFile", fileExtension: "mp4") {
                    saveDataToPath(data: data, path: path)
                    saveVideoFromPathTpGallery(path: path)
                } else {
                    print("Ошибка сохранения фото или видео в галлерею: - path отсутствует -")
                    showProgressWhileSavingStories = false
                    self.showVideoNOTSaved = true
                }
            } else {
                print("Ошибка сохранения фото или видео в галлерею: - data отсутствует -")
                showProgressWhileSavingStories = false
                self.showVideoNOTSaved = true
            }
        }
    }

    func saveImageToGallery(imageURL: String) async {
        if let url = URL(string: imageURL),
           let data = try? await URLSession.shared.data(from: url),
           let image = UIImage(data: data.0) {
            SaveToGalleryManager().saveImageToGallery(image)
            showProgressWhileSavingStories = false
            showStoriesSaved = true
        } else {
            showProgressWhileSavingStories = false
            showErrorSavingStories = true
        }
    }
}
