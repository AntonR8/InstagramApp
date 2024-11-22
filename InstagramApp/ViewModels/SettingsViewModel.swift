import SwiftUI
import Observation


@Observable
class SettingsViewModel {
    var cacheSize: String = "0"

    init() {
        self.cacheSize = getCacheSize()
    }

    func getCacheSize() -> String {
        var size = ""
        do {
            let cachesDirectory = try FileManager.default.url(for: .cachesDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            if let sizeOnDisk = try cachesDirectory.sizeOnDisk() {
                size = sizeOnDisk
                print("Size:", sizeOnDisk)
            }
        } catch { print(error) }
        return size
    }

    func clearCache() {
        self.cacheSize = "0 KB"
        do {
            if let path = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first?.appendingPathComponent ("tempFile.mp4").path {
                try FileManager.default.removeItem(atPath: path)
            }
        } catch {
            print(error)
        }
    }


    func requestAuthorization() -> Bool {
        var result = false
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { success, error in
            if error != nil {
                result = false
            } else {
                switch success {
                case true: result = true
                case false: result = false
                }
            }
        }
        return result
    }

}
