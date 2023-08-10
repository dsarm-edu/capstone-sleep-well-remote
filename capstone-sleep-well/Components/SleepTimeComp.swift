//
//  WakeTimeComp.swift
//  capstone-sleep-well
//
//  Created by Danica Sarmiento on 7/27/23.
//

import SwiftUI

struct SleepTimeComp: View {
    
    var sleepTimeResults: String
    
    
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
                
                Text(sleepTimeResults)
                    .multilineTextAlignment(
                            .center)

//                Image("Block-6")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 350.0, height: 50.0)
//                Spacer()
//
//                Image("Block-5")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 350.0, height: 50.0)
//
//                Spacer()
//
//                Image("Block-4")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 350.0, height: 50.0)
                Spacer()
                Spacer()
            }
            .foregroundColor(.white)
            
            Image("Text-WakeTimes3")
                .resizable()
                .aspectRatio(contentMode: .fit)

            Image("Text-Info1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .offset(y:-50)

            Image("Text-Info2")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .offset(y: -120)
            
            
        }
//        .background(Color("Dark-Purple"))

    }
}

struct SleepTimeComp_Previews: PreviewProvider {
    static var previews: some View {
        SleepTimeComp(sleepTimeResults: "sleeptimeresult sample")
            .background(Color("Dark-Purple"))
    }
}

//sleepTimeResults: .constant("Sample sleepTimeResults")
