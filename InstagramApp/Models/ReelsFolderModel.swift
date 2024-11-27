//
//  VideoFolderModel.swift
//  TikTokApp
//
//  Created by Антон Разгуляев on 01.11.2024.
//

import Foundation

struct ReelsFolderModel: Codable, Hashable {
    let reelsArray: [ReelsModel]
    let name: String

    func addClip(reels: ReelsModel) -> ReelsFolderModel {
        var instanseReels: [ReelsModel] = reelsArray
        instanseReels.append(reels)
        return ReelsFolderModel(reelsArray: instanseReels, name: name)
    }

    func deleteClip(reels: ReelsModel) -> ReelsFolderModel {
        var instanseClips: [ReelsModel] = reelsArray
        if let index = instanseClips.firstIndex(where: {$0.description == reels.description}) {
            instanseClips.remove(at: index)
        }
        return ReelsFolderModel(reelsArray: instanseClips, name: name)
    }

    func changeName(newName: String) -> ReelsFolderModel {
        return ReelsFolderModel(reelsArray: reelsArray, name: newName)
    }
}
