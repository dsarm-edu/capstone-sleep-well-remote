//
//  EntryFormView.swift
//  capstone-sleep-well
//
//  Created by Danica Sarmiento on 7/28/23.
//

import SwiftUI

struct EntryFormView: View {
    @StateObject var entryManager: EntryManager
    
    var body: some View {
        ZStack {
            Image("Background-Main")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            ScrollView {
                VStack {
                    HomeHeader()
                    EntryForm()
                        .environmentObject(entryManager)
                }
            }
        }
    }
}

struct EntryFormView_Previews: PreviewProvider {
    static var previews: some View {
        EntryFormView(entryManager: EntryManager())
    }
}
