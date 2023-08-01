//
//  WakeTimeComp.swift
//  capstone-sleep-well
//
//  Created by Danica Sarmiento on 7/27/23.
//

import SwiftUI

struct SleepTimeComp: View {
    var body: some View {
        VStack {
            
            Spacer()
            Spacer()
            Spacer()
            Image("Text-WakeTimes2")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            VStack {
                Spacer()
                Spacer()
                Spacer()
                Image("Block-4")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 350.0, height: 50.0)
                Spacer()
                
                Image("Block-5")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 350.0, height: 50.0)
                
                Spacer()
                
                Image("Block-6")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 350.0, height: 50.0)
                Spacer()
                Spacer()
            }
            
            Image("Text-WakeTimes3")
                .resizable()
                .aspectRatio(contentMode: .fit)
//                .frame(width: 320, height: 150)
            
            Image("Text-Info1")
                .resizable()
                .aspectRatio(contentMode: .fit)
//                .frame(width: 320, height: 150)
                .offset(y:-50)
            
            Image("Text-Info2")
                .resizable()
                .aspectRatio(contentMode: .fit)
//                .frame(width: 320, height: 150)
                .offset(y: -120)
            
            
        }
//        .background(Color("Dark-Purple"))

    }
}

struct SleepTimeComp_Previews: PreviewProvider {
    static var previews: some View {
        SleepTimeComp()
            .background(Color("Dark-Purple"))
    }
}
