//
//  EntryManager.swift
//  capstone-sleep-well
//
//  Created by Danica Sarmiento on 8/2/23.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift


class EntryManager: ObservableObject {
    @Published private(set) var entries: [Entry] = []
    
    let db = Firestore.firestore()
    
    init() {
        getEntries()
    }
    
    func getEntries() {

        db.collection("entries").addSnapshotListener { querySnapshot, error in

            guard let documents = querySnapshot?.documents else {
                print("Error fetching documents")
                return
            }
            
            self.entries = documents.compactMap { document -> Entry? in
                do {
                    return try document.data(as: Entry.self)
                } catch {
                    print("Error decoding document into Entry: \(error)")
                    return nil
                }
            }
            print(self.entries)
            print(documents)

            self.entries.sort(by: {
                $0.date.compare($1.date) == .orderedDescending
            })
        }
    }
    
    func addEntry(date: Date, sleepTime: Date, wakeTime: Date, notes: String) {
        
        guard !date.description.isEmpty else {
            return
        }
        
        let newEntry = Entry(
            date: date,
            sleepTime: sleepTime,
            wakeTime: wakeTime,
            notes: notes)
        
        do {
            try db.collection("entries").document().setData(from: newEntry)
            
        } catch {
            print("Error adding entry to Firestore: \(error)")
        }
    }
    
    func deleteEntry(toDelete: Entry) {
        guard let entryID = toDelete.id else {
            print("Error: Entry ID missing")
            return
        }
        
        db.collection("entries").document(entryID).delete() { error in
            if let error = error {
                print("Error removing entry: \(error)")
            } else {
                print("Entry \(entryID) succesfully removed.")
            }
        }
    }
    
    func updateEntry(toUpdate: Entry, date: Date, sleepTime: Date, wakeTime: Date, notes: String) {
        
        guard let entryID = toUpdate.id else {
            print("Error: Entry ID missing")
            return
        }
        
        let docRef = db.collection("entries").document(entryID)
        
        docRef.updateData(["date": date,"sleepTime": sleepTime, "wakeTime": wakeTime, "notes": notes]) {
            error in
            if let error = error {
                print("Error updating document: \(error)")
            } else {
                print("Document succesfully updated")
            }
        }
    }
}
