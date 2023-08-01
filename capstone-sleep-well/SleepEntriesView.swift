//
//  SleepLogs.swift
//  capstone-sleep-well
//
//  Created by Danica Sarmiento on 7/28/23.
//

import SwiftUI

struct SleepEntriesView: View {
    var body: some View {
        ZStack {

            Image("Background-Main")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            ScrollView {
                
                VStack {
                    BackButton()
                    SleepListHeader()
                        .offset(y: 20)
                    EntryList()
                        .offset(y: 30)

                }
            }
        }
    }
}

struct SleepEntriesView_Previews: PreviewProvider {
    static var previews: some View {
        SleepEntriesView()
    }
}
