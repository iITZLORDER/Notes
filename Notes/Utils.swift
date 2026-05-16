import SwiftUI
import Foundation


let documentsURL = URL.documentsDirectory
let fileManager = FileManager.default

func saveNote(state: AppState) -> Bool {
    var isWritten: Bool = true
    
    let fileURL = documentsURL.appendingPathComponent("\(state.currentNote).txt")
    let data = state.data.data(using: .utf8)
    
    do {
        try data?.write(to: fileURL, options: [.atomic, .completeFileProtection])
    } catch {
        print("Failed to write: \(error.localizedDescription)")
        isWritten = false
    }
    return isWritten
}


func loadNote(state: AppState) -> String? {
    let fileURL = documentsURL.appending(path: "\(state.currentNote).txt")
    
    do {
        return try String(contentsOf: fileURL, encoding: .utf8)
    } catch {
        print("Failed to load: \(error.localizedDescription)")
        return nil
    }
}

func loadNote(fileName: String) -> String {
    let fileURL = documentsURL.appendingPathComponent("\(fileName).txt")
    
    do {
        return try String(contentsOf: fileURL, encoding: .utf8)
    } catch {
        print("Failed to load: \(error.localizedDescription)")
        return ""
    }
}
func clearDocumentsDirectory() -> Void {
    guard let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {
        return
    }
    
    do {
        let fileURLs = try fileManager.contentsOfDirectory(at: documentsDirectory, includingPropertiesForKeys: nil)
        
        for fileURL in fileURLs {
            try fileManager.removeItem(at: fileURL)
        }
    } catch {
        print("Error clearing Documents directory: \(error.localizedDescription)")
    }
}

func getAllNotes() -> [String] {
    do {
        let fileURLs = try fileManager.contentsOfDirectory(at: documentsURL, includingPropertiesForKeys: nil)
        return fileURLs.map { $0.deletingPathExtension().lastPathComponent }
    } catch {
        print("Error: \(error.localizedDescription)")
        return []
    }
}


func deleteNote(fileName: String) {
    let fileURL = documentsURL.appendingPathComponent("\(fileName).txt")
    
    do {
        try fileManager.removeItem(at: fileURL)
    } catch {
        print("Failed to delete: \(error.localizedDescription)")
    }
}
