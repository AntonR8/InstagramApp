import SwiftUI
import AVKit
import Observation


@Observable
final class AudioPlayerViewModel {
    let playlist: [TrackModel]
    var trackIndex: Int?

    var player: AVPlayer?
    var isPlaying = false
    var totalTime: TimeInterval = 0.0
    var currentTime: TimeInterval = 0.0

    var showAudioPlayer = false

    init(playlist: [TrackModel]) {
        self.playlist = playlist
    }

// MARK: - Функции
    // Плеер:
    func playPauseButtonPushed() {
        isPlaying ? pause() : play(trackURL: returnTrackURL())
    }

    func play(trackURL: String) {
        player?.play()
        isPlaying = true
    }

    func pause() {
        player?.pause()
        isPlaying = false
    }

    func seekAudio(to time: TimeInterval) {
        let cmtime = CMTime(seconds: time, preferredTimescale: 1)
        player?.seek(to: cmtime)
    }

    func updateProgress() {
        guard let player = player else { return }
        currentTime = player.currentTime().seconds
        if currentTime == totalTime {
            if isPlaying { pause() }
            seekAudio(to: 0)
        }
   }




    func setupAudio(trackURL: String) async {
        guard let url = URL(string: trackURL) else { return }
        player = AVPlayer(url: url)
        do { totalTime = try await player?.currentItem?.asset.load(.duration).seconds ?? 0 }
        catch let error { print(error) }
    }


    func albumPlayButtonPushed(index: Int) {
        Task {
            if index != trackIndex {
                await setupAudio(trackURL: playlist[safe: index]?.url ?? "")
            }

            await MainActor.run {
                if index != trackIndex {
                    isPlaying = false
                }
                trackIndex = index
                if !showAudioPlayer { showAudioPlayer = true }
                playPauseButtonPushed()
            }
        }
    }



    // Управление плеером:
    func closeButtonPushed() {
        pause()
        showAudioPlayer = false
    }

    func forwardButtonPushed() {
        if let trackIndex, playlist.count > trackIndex+1 {
            print("trackIndex: \(trackIndex), playlist.count: \(playlist.count)")
            albumPlayButtonPushed(index: trackIndex+1)
        } else {
            pause()
            seekAudio(to: 0)
        }
    }

    // интерфейс:
    func returnHTTPScoverURL(playlist: [TrackModel], trackIndex: Int) -> String {
        guard
            !playlist.isEmpty,
            let coverURL = playlist[safe: trackIndex]?.cover,
            coverURL.count>5
        else { return "" }

        let first5 = coverURL.prefix(5)
        if first5.last != "s" {
            return "https" + coverURL.dropFirst(4)
        } else {
            return coverURL
        }
    }

    func returnTrackTitle() -> String {
        if let trackIndex {
            return playlist[safe: trackIndex]?.title ?? ""
        } else { return "" }
    }

    func returnTrackCreator() -> String {
        if let trackIndex {
            return playlist[safe: trackIndex]?.creator ?? ""
        } else { return "" }
    }

    func returnTrackURL() -> String {
        if let trackIndex {
            return playlist[safe: trackIndex]?.url ?? ""
        } else { return "" }
    }

    func returnTrackCoverURL() -> String {
        if let trackIndex {
            return playlist[safe: trackIndex]?.cover ?? ""
        } else { return "" }
    }

    func timeString(time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }

    func returnTrackDuration() -> String {
        timeString(time: totalTime)
    }

    func returnTrackProgress() -> String {
        timeString(time: currentTime)
    }

}


