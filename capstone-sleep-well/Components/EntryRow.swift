//
//  EntryRow.swift
//  capstone-sleep-well
//
//  Created by Danica Sarmiento on 7/28/23.
//

import SwiftUI

struct EntryRow: View {
    
    @EnvironmentObject var entryManager: EntryManager
    var entry: Entry
    
    var body: some View {
        
        HStack {
            Text(entry.formatEntryDate())
                .foregroundColor(.white)
//          call the entry.name of func/date formatter
            
            Spacer()
            Button {
                entryManager.deleteEntry(toDelete: entry)
            } label: {
                Image(systemName: "trash")
                    .foregroundColor(.white)
            }
        }
        .frame(height: 35)
        .padding(.horizontal, 19)
        .padding(.vertical, 10)
        .background(Color("Light-Purple"))
        .padding(.horizontal, 35)
    }
}

struct EntryRow_Previews: PreviewProvider {
    static var previews: some View {
        List {
            EntryRow(entry: Entry(date: Date(), sleepTime: Date(), wakeTime: Date(), notes: "Testing"))
//            put hard coded data here
//            EntryRow()
        }
    }
}
