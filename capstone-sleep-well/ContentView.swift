//
//  ContentView.swift
//  capstone-sleep-well
//
//  Created by Danica Sarmiento on 7/25/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack {
            Image("Background-Main")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            VStack {
                HomeHeader()
                    .offset(y: -250)
                TimeQuery()
                    .offset(y: -150)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
