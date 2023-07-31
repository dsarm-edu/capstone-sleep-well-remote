//
//  SleepListHeader.swift
//  capstone-sleep-well
//
//  Created by Danica Sarmiento on 7/28/23.
//

import SwiftUI

struct SleepListHeader: View {
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
                print("Add entry button")
            } label: {
                Image(systemName: "plus.square")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 35.0, height: 35.0)
                    .padding(.trailing)
                    .foregroundColor(.white)
            }
            Spacer()
        }
    }
}

struct SleepListHeader_Previews: PreviewProvider {
    static var previews: some View {
        SleepListHeader()
            .background(Color("Dark-Purple"))
    }
}
