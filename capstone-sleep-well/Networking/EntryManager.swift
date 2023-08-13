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
    //    Publishes a list of entries that the UI can watch. Updates the list when data changes
    
    let db = Firestore.firestore()
    
    init() {
        getEntries()
    }
    
    func getEntries() {
        //        Set up snapshot listener
        db.collection("entries").addSnapshotListener { querySnapshot, error in
            //        If there are no documents, exit function
            guard let documents = querySnapshot?.documents else {
                print("Error fetching documents")
                return
            }
            
            //        If there are docs, map them from Firestore to the Entry model
            //        If we run into error, print to console
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
            //        Sort entries by date with most recent date on top
            //        Set the entries variable
            self.entries.sort(by: {
                $0.date.compare($1.date) == .orderedDescending
            })
        }
    }
    
    func addEntry(date: Date, sleepTime: Date, wakeTime: Date, notes: String) {
        //        If there is no entry, just return
        guard !date.description.isEmpty else {
            return
        }
        //    Create a new Entry instance with the date parameter, sleepTime parameter, wakeTime parameter, and notes parameter
        let newEntry = Entry(
            date: date,
            sleepTime: sleepTime,
            wakeTime: wakeTime,
            notes: notes)
        
        //    Create a new document in Firestore with the newEntry variable above, and use setData(from:)
        //    to convert the Entry into Firestore data.
        
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

// update data - just pass in the entry id and specific fields we want to edit
//what values are we setting it to?
