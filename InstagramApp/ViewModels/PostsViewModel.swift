

import SwiftUI
import Photos
import Observation


@Observable
final class PostsViewModel {
    var posts: [PostFolderModel] {
        didSet { savePosts() }
    }

    private var oldFolderName = ""
    var newFolderName = ""

    var showCreateNewFolderAllert = false
    var showRenameFolderAllert = false
    var showSelectPostFolders = false
    var postsForAdd: PostModel?



    // notifications:
    var showAddedToFolder = false
    var showTextCopied = false
    var showImageSaved = false
    var showImagesSaved = false
    var showProgressWhileSavingImages = false
    var showProgressWhileSavingImage = false
    var showErrorSavingImage = false


    init () {
        let recents = PostFolderModel(postsArray: [], name: "Recents")
        let saved = PostFolderModel(postsArray: [], name: "Saved")
        self.posts = [recents, saved]

        loadPosts()
        preFetchCovers()
    }

    // init:
    private func savePosts() {
        if let encodedData = try? JSONEncoder().encode(posts) {
            UserDefaults.standard.setValue(encodedData, forKey: "postsFolder")
        }
    }

    func loadPosts() {
        guard
            let postsData = UserDefaults.standard.data(forKey: "postsFolder"),
            let savedPosts = try? JSONDecoder().decode([PostFolderModel].self, from: postsData)
        else { return }
        self.posts = savedPosts
    }

    private func preFetchCovers() {
        var urls: [String] = []
        for folder in posts {
            for post in folder.postsArray {
                if let imageDownloadUrl = post.carousel.first?.imageDownloadUrl {
                    urls.append(imageDownloadUrl)
                }
            }
        }
        DispatchQueue.global().async {
            ImagePreFetcher.shared.startPrefetching(stringURLs: urls)
        }
    }

    // folders:
    private func addFolder(folderName: String) {
        let newFolder = PostFolderModel(postsArray: [], name: folderName)
        posts.append(newFolder)
    }

    func deleteFolder(folderIndex: Int) {
        if posts[safe: folderIndex] != nil {
            if posts[folderIndex].name == "Recents" || posts[folderIndex].name == "Saved" { return }
            posts.remove(at: folderIndex)
        }
    }

    private func changeFolderName() {
        if let index = posts.firstIndex(where: {$0.name == oldFolderName}) {
            posts[index] = posts[index].changeName(newName: newFolderName)
        }
    }

    func returnFolder(folderName: String) -> PostFolderModel? {
        posts.first(where: {$0.name == folderName})
    }

    func renameFolderPressed(folderName: String) {
        showRenameFolderAllert = true
        newFolderName = folderName
        oldFolderName = folderName
    }

    func saveNewFolder() {
        addFolder(folderName: newFolderName)
        newFolderName  = ""
        showSelectPostFolders = true
    }

    func saveRenamedPostFolder() {
        changeFolderName()
        newFolderName = ""
        oldFolderName = ""
        showRenameFolderAllert = false
    }

    func buttonSavePostInFolderAction(selectedFolderIndex: Int) {
        if let postsForAdd {
            addPosts(to: selectedFolderIndex, postsForAdd: postsForAdd)
            showSelectPostFolders = false
        }
    }

    // posts:
    private func addPosts(to folderIndex: Int, postsForAdd: PostModel) {
        if posts[safe: folderIndex] != nil {
            posts[folderIndex] = posts[folderIndex].addPosts(posts: postsForAdd)
            print("Клип \(posts.description) в \(posts[folderIndex].name) добавлен")
            if !(posts[folderIndex].name == "Recents") {
                showAddedToFolder = true
            }
        }
    }

    func addPosts(to folderName: String, postsForAdd: PostModel) {
        if let index = posts.firstIndex(where: {$0.name == folderName}) {
            if posts[index].postsArray.last?.imageDownloadUrl != postsForAdd.imageDownloadUrl {
                posts[index] = posts[index].addPosts(posts: postsForAdd)
                print("Пост в \(folderName) добавлен")
                if !(folderName == "Recents") {
                    showAddedToFolder = true
                }
            }
        } else {
            print("Ошибка добавления поста")
        }
    }



   func removePost(from folderName: String, post: PostModel) {
        if let index = posts.firstIndex(where: {$0.name == folderName}) {
            posts[index] = posts[index].deletePost(post: post)
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

    func returnRecentsFolder() -> PostFolderModel {
        guard
            let recentsFolder = posts.first(where: {$0.name == "Recents"}),
            recentsFolder.postsArray.count > 0
        else { return PostFolderModel(postsArray: [], name: "Recents") }
        return recentsFolder
    }

    func createRecentFourPosts() -> [PostModel] {
        guard
            let recentsFolder = posts.first(where: {$0.name == "Recents"}),
            recentsFolder.postsArray.count > 0
        else { return [] }

        var postsArray: [PostModel] = []
        for i in 1...recentsFolder.postsArray.count {
            let fetchedPostss = recentsFolder.postsArray[recentsFolder.postsArray.count-i]
            postsArray.append(fetchedPostss)
        }
        return postsArray
    }

    // download:
    func saveImageToGallery(imageURL: String) async {
        if let url = URL(string: imageURL),
           let data = try? await URLSession.shared.data(from: url),
           let image = UIImage(data: data.0) {
            SaveToGalleryManager().saveImageToGallery(image)
            showProgressWhileSavingImage = false
            showImageSaved = true
        } else {
            showProgressWhileSavingImage = false
            showErrorSavingImage = true
        }
    }

}



