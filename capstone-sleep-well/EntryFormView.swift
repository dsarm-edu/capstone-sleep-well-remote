//
//  EntryFormView.swift
//  capstone-sleep-well
//
//  Created by Danica Sarmiento on 7/28/23.
//

import SwiftUI

struct EntryFormView: View {
    @StateObject var entryManager: EntryManager
    @Binding public var path: NavigationPath
    @Binding var showDetails: Bool
    
    var body: some View {
        ZStack {
            Image("Background-Main")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            ScrollView {
                VStack {
                    HomeHeader(path: $path, showDetails: $showDetails)
                    EntryForm()
                        .environmentObject(entryManager)
                }
            }
        }
    }
}

struct EntryFormView_Previews: PreviewProvider {
    static var previews: some View {
        EntryFormView(entryManager: EntryManager(), path: .constant(NavigationPath()), showDetails: .constant(true))
    }
}
