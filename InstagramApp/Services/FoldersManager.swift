
import SwiftUI


final class FoldersManager {

    func saveFolders<T: Encodable>(_ object: T, forKey key: String) {
        if let encodedData = try? JSONEncoder().encode(object) {
            UserDefaults.standard.setValue(encodedData, forKey: key)
        }
    }

    func loadData<T: Codable>(forKey key: String, type: T.Type) -> T? {
        guard
            let receivedData = UserDefaults.standard.data(forKey: key),
            let encodedData = try? JSONDecoder().decode(type, from: receivedData)
        else { return nil}
        return encodedData
    }

}
