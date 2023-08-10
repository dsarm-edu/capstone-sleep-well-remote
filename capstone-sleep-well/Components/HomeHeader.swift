//
//  HomeHeader.swift
//  capstone-sleep-well
//
//  Created by Danica Sarmiento on 7/27/23.
//

import SwiftUI

struct HomeHeader: View {
    
    @Binding public var path: NavigationPath
    
    var body: some View {
        
        HStack {
            Image("Moon-Icon")
                .resizable()
                .frame(width: 150, height: 150)
            
            Spacer()
            
            Image("SleepWell-Word-Icon")
                .resizable()
                .frame(width: 100, height: 25)
                .padding(.trailing)
            
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            
//            Triggers print statement but does not navigate to the SleepEntriesView
            
            NavigationLink(destination: SleepEntriesView(entryManager: EntryManager())) {
                Button(action: {
                    print("Button/emoji pressed")
                }) {
                    Image("Button-Diary")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40.0, height: 40.0)
                        .padding(.trailing)
                }
            }
            
//            .navigationDestination(for: String.self) { view in
//                SleepEntriesView(entryManager: EntryManager())
//            }
                
            Spacer()
            }
        }
    }
    
    struct HomeHeader_Previews: PreviewProvider {
        static var previews: some View {
//            HomeHeader()
            HomeHeader(path: .constant(NavigationPath()))
                .background(Color("Dark-Purple"))
        }
    }
