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
//                    HStack {
//                        Image("Moon-Icon")
//                            .resizable()
//                            .frame(width: 150, height: 150)
//
//
//                        Image("SleepWell-Word-Icon")
//                            .resizable()
//                            .frame(width: 100, height: 25)
//                            .padding(.trailing)
//
//                        Spacer()
//                    }
//
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
