
import SwiftUI
import Observation

@Observable
final class RestrictionsManager {
   static var shared = RestrictionsManager()

    var savedMediaCounter = 0


    var stopDate: Date? {
        didSet { saveStopDate() }
    }

    private init() {
        loadStopDate()
    }

    // init:
    func saveStopDate() {
        if let encodedData = try? JSONEncoder().encode(stopDate) {
            UserDefaults.standard.setValue(encodedData, forKey: "stopDate")
        }
    }

    func loadStopDate() {
        guard
            let stopDateData = UserDefaults.standard.data(forKey: "stopDate"),
            let receivedStopDate = try? JSONDecoder().decode(Date.self, from: stopDateData)
        else { return }
        self.stopDate = receivedStopDate
    }

    // Restrictions:
    func updateCounter() {
        self.savedMediaCounter += 1
        if savedMediaCounter >= 2 {
            self.stopDate = .now
            self.savedMediaCounter = 0
        }
    }

    func freeSavingsRemain() -> Bool {
        if let stopDate {
           return !Calendar.current.isDate(stopDate, inSameDayAs: .now)
        } else {
            return true
        }
    }

}

