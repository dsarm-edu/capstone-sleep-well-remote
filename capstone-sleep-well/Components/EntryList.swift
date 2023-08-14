//
//  EntryList.swift
//  capstone-sleep-well
//
//  Created by Danica Sarmiento on 7/31/23.
//

import SwiftUI

struct EntryList: View {
    @EnvironmentObject var entryManager: EntryManager
    @Binding var path: NavigationPath
    
//    pass in current entry for the row we're on
    
    var body: some View {
        ScrollView {
            ForEach(entryManager.entries, id: \.id) { entry in
                EntryRow(entry: entry, path: $path)
                    .environmentObject(entryManager)
                    .onTapGesture {
                        print("Entry with ID \(String(describing: entry.id)) tapped")
                    }
            }
        }
    }
}

struct EntryList_Previews: PreviewProvider {
    static var previews: some View {
        EntryList(path: .constant(NavigationPath()))
            .environmentObject(EntryManager())
            .background(Color("Dark-Purple"))
    }
}
