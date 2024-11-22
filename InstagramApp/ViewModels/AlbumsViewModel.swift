//
//  MusicViewModel.swift
//  SaveTik
//
//  Created by Антон Разгуляев on 12.11.2024.
//
import SwiftUI
import Observation


@Observable
class AlbumsViewModel {
    var music: [MusicFolderModel] {
        didSet { saveMusic() }
    }
    
    var savedPlaylists: [CountryChart] {
        didSet { savePlaylists() }
    }

    var numberOfMusicSavings = 0 {
        didSet { saveNumberOfSavings() }
    }

    var showChangeFolderNameAllert = false
    var showCreateNewFolderAllert = false
    var oldFolderName = ""
    var newFolderName = ""
    var trackForAdd: TrackModel?
    var showAddedToFolder = false

    var showAddedToSavedAlert = false
    var showSelectFolders = false
    
    init () {
        let saved = MusicFolderModel(tracks: [], name: "Saved")
        self.music = [saved]
        self.savedPlaylists = []

        loadMusic()
        loadPlaylists()
        loadNumberOfSavings()

        preFetchCovers()
    }
    
    // MARK: - Functions
    
    // init:
    func saveMusic() {
        if let encodedData = try? JSONEncoder().encode(music) {
            UserDefaults.standard.setValue(encodedData, forKey: "music")
        }
    }

    func loadMusic() {
        guard
            let musicData = UserDefaults.standard.data(forKey: "music"),
            let savedMusic = try? JSONDecoder().decode([MusicFolderModel].self, from: musicData)
        else { return }
        self.music = savedMusic
    }

    func savePlaylists() {
        if let encodedData = try? JSONEncoder().encode(savedPlaylists) {
            UserDefaults.standard.setValue(encodedData, forKey: "savedPlaylists")
        }
    }

    func loadPlaylists() {
        guard
            let playlistsData = UserDefaults.standard.data(forKey: "savedPlaylists"),
            let playlists = try? JSONDecoder().decode([CountryChart].self, from: playlistsData)
        else { return }
        self.savedPlaylists = playlists
    }

    func saveNumberOfSavings() {
        if let encodedData = try? JSONEncoder().encode(numberOfMusicSavings) {
            UserDefaults.standard.setValue(encodedData, forKey: "numberOfMusicSavings")
        }
    }

    func loadNumberOfSavings() {
        guard
            let numberOfMusicSavingsData = UserDefaults.standard.data(forKey: "numberOfMusicSavings"),
            let receivedNumberOfMusicSavings = try? JSONDecoder().decode(Int.self, from: numberOfMusicSavingsData)
        else { return }
        self.numberOfMusicSavings = receivedNumberOfMusicSavings
    }

    func preFetchCovers() {
        var urls: [String] = []
        for folder in music {
            for track in folder.tracks {
                if track.cover.count > 5 {
                    let first5 = track.cover.prefix(5)
                    if first5.last == "s" {
                        urls.append(track.cover)
                    } else {
                        urls.append("https" + track.cover.dropFirst(4))
                    }
                }
            }
        }
        DispatchQueue.global().async {
            ImagePreFetcher.shared.startPrefetching(stringURLs: urls)
        }
    }

    // folders:
    func addFolder(folderName: String) {
        let newFolder = MusicFolderModel(tracks: [], name: folderName)
        music.append(newFolder)
    }
    
    func deleteFolder(folderIndex: Int) {
        if music[safe: folderIndex] != nil {
            if music[folderIndex].name == "Saved" { return }
            music.remove(at: folderIndex)
        }
    }
    
    func changeFolderName(from oldName: String, to newName: String) {
        if let index = music.firstIndex(where: {$0.name == oldName}) {
            music[index] = music[index].changeName(newName: newName)
        }
    }
    
    func renameFolderPressed(folderName: String) {
        showChangeFolderNameAllert = true
        newFolderName = folderName
        oldFolderName = folderName
    }
    
    func renameFolderSaveButtonPressed() {
        changeFolderName(from: oldFolderName, to: newFolderName)
        newFolderName = ""
        oldFolderName = ""
        showChangeFolderNameAllert = false
    }

    func buttonSaveTrackInFolderAction(selectedFolderIndex: Int) {
        if let track = trackForAdd {
            addTrack(to: selectedFolderIndex, track: track)
            showSelectFolders = false
        } else { print("trackForAdd отсутствует, не выбран") }
    }

    func renameFolderSaveAction() {
//            musicManager.changeFolderName(from: videosManager.oldFolderName, to: videosManager.newFolderName)
//            musicManager.newFolderName = ""
//            musicManager.oldFolderName = ""
//        }
    }

//    func returnFolder(folderName: String) -> MusicFolderModel? {
//        music.first(where: {$0.name == folderName})
//    }

    

    // add / remove clips:
    func addTrack(to folderIndex: Int, track: TrackModel) {
        if music[safe: folderIndex] != nil {
            music[folderIndex] = music[folderIndex].addTrack(track: track)
            print("Трек \(track.title) в \(music[folderIndex].name) добавлен")
            showAddedToFolder = true
        } else { print("Ошибка добавления трека в папку: нет такой папки")}
    }
    
    func removeTrack(from folderName: String, track: TrackModel) {
        if let index = music.firstIndex(where: {$0.name == folderName}) {
            music[index] = music[index].deleteTrack(track: track)
        }
    }
    
    //playlists::
    func addPlaylist(playlist: CountryChart) {
        savedPlaylists.append(playlist)
    }
    
    func removePlaylist(playlist: CountryChart) {
        if let index = savedPlaylists.firstIndex(where: {$0.id == playlist.id}) {
            savedPlaylists.remove(at: index)
        }
    }

    func buttonSavePlaylistAction(chart: CountryChart) {
        if checkPlaylistIsSaved(chart: chart) {
            removePlaylist(playlist: chart)
        } else {
            withAnimation {
                addPlaylist(playlist: chart)
                showAddedToSavedAlert = true
            }
        }
    }

    func buttonAddTrackToFavouritesAction(track: TrackModel) {
        trackForAdd = track
        showSelectFolders = true
        numberOfMusicSavings += 1
    }

    // interface:
    func returnIcon(folder: MusicFolderModel) -> String {
        switch folder.name {
        case "Saved": "bookmark"
        default: "folder"
        }
    }
    
    func checkTrackIsSaved(track: TrackModel) -> Bool {
        for folder in music {
            if folder.tracks.contains(track) {
                return true
            }
        }
        return false
    }

    func checkPlaylistIsSaved(chart: CountryChart) -> Bool {
        savedPlaylists.contains(chart)
    }

}

