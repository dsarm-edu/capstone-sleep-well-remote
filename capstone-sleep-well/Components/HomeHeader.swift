//
//  HomeHeader.swift
//  capstone-sleep-well
//
//  Created by Danica Sarmiento on 7/27/23.
//

import SwiftUI

struct HomeHeader: View {
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
            
            Button {
            } label: {
                Image("Button-Diary")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40.0, height: 40.0)
                    .padding(.trailing)
            }
            
            Spacer()
        }
    }
}

struct HomeHeader_Previews: PreviewProvider {
    static var previews: some View {
        HomeHeader()
            .background(Color("Dark-Purple"))
    }
}
