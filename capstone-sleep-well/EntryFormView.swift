//
//  EntryFormView.swift
//  capstone-sleep-well
//
//  Created by Danica Sarmiento on 7/28/23.
//

import SwiftUI

struct EntryFormView: View {
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
                }
            }
        }
    }
}

struct EntryFormView_Previews: PreviewProvider {
    static var previews: some View {
        EntryFormView()
    }
}
