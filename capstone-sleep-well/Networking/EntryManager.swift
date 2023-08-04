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
}
