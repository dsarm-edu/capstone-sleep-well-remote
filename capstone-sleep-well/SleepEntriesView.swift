//
//  SleepLogs.swift
//  capstone-sleep-well
//
//  Created by Danica Sarmiento on 7/28/23.
//

import SwiftUI

struct SleepEntriesView: View {
    @StateObject var entryManager: EntryManager
    @Binding var path: NavigationPath
//    @Binding var showDetails: Bool
    
    var body: some View {
        ZStack {

            Image("Background-Main")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            ScrollView {
                
                VStack {
                    SleepListHeader(path: $path)
                        .offset(y: 20)
                    EntryList(path: $path)
                        .environmentObject(entryManager)
                        .offset(y: 30)
                }
            }
        }
        .offset(y: 15)
    }
}

struct SleepEntriesView_Previews: PreviewProvider {
    static var previews: some View {
        SleepEntriesView(entryManager: EntryManager(),
                         path: .constant(NavigationPath()))
    }
}
