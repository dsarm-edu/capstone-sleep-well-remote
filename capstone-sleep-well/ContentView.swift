//
//  ContentView.swift
//  capstone-sleep-well
//
//  Created by Danica Sarmiento on 7/25/23.
//

import SwiftUI

struct ContentView: View {
    
    @State public var path = NavigationPath()
    @State var showDetails = false
    @StateObject var time = Time()
    
    var body: some View {
            
        NavigationStack (path: $path) {
            GeometryReader { geometry in
                Image("Background-Main")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                    .frame(width:geometry.size.width, height: geometry.size.height)
            }
            .overlay(
            
                VStack {

                    HomeHeader(path: $path)
                        .offset(y: -250)
                    
                    TimeQuery(time: time, path: $path)
                        .offset(x: 5, y: -80)
                }
        )}
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
