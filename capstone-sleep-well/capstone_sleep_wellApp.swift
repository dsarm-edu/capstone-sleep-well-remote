//
//  capstone_sleep_wellApp.swift
//  capstone-sleep-well
//
//  Created by Danica Sarmiento on 7/25/23.
//

import SwiftUI
import Firebase

@main
struct capstone_sleep_wellApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
//            ContentView()
            SleepEntriesView(entryManager: EntryManager())
        }
    }
}
