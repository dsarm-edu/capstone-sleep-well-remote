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
    
    @Binding var path: NavigationPath
    @State var showExistingEntry: Bool = false
    
    var body: some View {
        HStack {
            Text(entry.formatEntryDate())
                .foregroundColor(.white)
            
            Spacer()
            
            Button {
                showExistingEntry = true
                print("Edit button pressed")
                //                 entryManager.updateEntry(toUpdate: entry)
                
            } label: {
                Image(systemName: "pencil")
                    .foregroundColor(.white)
            }
            .navigationDestination(isPresented: $showExistingEntry) {
                EntryFormView(entryManager: EntryManager(), path: $path)
            }
            .buttonStyle(BorderlessButtonStyle())
            
            Button {
                entryManager.deleteEntry(toDelete: entry)
                //                showDetails = false
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
    
    
    struct EntryRow_Previews: PreviewProvider {
        static var previews: some View {
            List {
                EntryRow(entry: Entry(date: Date(), sleepTime: Date(), wakeTime: Date(), notes: "Testing"),
                         path: .constant(NavigationPath()))
            }
        }
    }
}
