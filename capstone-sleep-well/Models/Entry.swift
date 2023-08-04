//
//  Entry.swift
//  capstone-sleep-well
//
//  Created by Danica Sarmiento on 8/2/23.
//

// Defines an Entry object that represents a network response

import Foundation
import FirebaseFirestoreSwift

struct Entry: Identifiable, Codable {
    @DocumentID var id: String?
    var date: Date
    var sleepTime: Date
    var wakeTime: Date
    var notes: String
    
    func formatEntryDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        let dateString = dateFormatter.string(from: Date())
        return dateFormatter.string(from: date)
    }
}
// add the date formatter function to this struct
