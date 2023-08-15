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
    
    var body: some View {
        ZStack {
            Image("Background-Main")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            ScrollView {
                VStack {
                    Spacer()
                    EntryForm()
                        .environmentObject(entryManager)
                        .offset(y: -50)
                }
                .offset(y:25)
            }
        }
    }
}

struct EntryFormView_Previews: PreviewProvider {
    static var previews: some View {
        EntryFormView(entryManager: EntryManager(), path: .constant(NavigationPath()))
    }
}
