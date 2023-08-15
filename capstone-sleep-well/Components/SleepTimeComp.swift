//
//  WakeTimeComp.swift
//  capstone-sleep-well
//
//  Created by Danica Sarmiento on 7/27/23.
//

import SwiftUI

struct SleepTimeComp: View {
    
    @EnvironmentObject var time: Time
    
    var sleepTimeResults: String
    
    var body: some View {
        VStack {
            Spacer()
            Image("Text-WakeTimes2")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .offset(y:80)
            Spacer()
            VStack {
                Spacer()
                
                Text(sleepTimeResults)
                    .padding()
                    .font(.title2)
                    .multilineTextAlignment(
                            .center)
                    .frame(width: 250)
                    .foregroundColor(.white)
                    .background(Color("Light-Purple")
                        .opacity(0.4))
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.white, lineWidth: 3))
            }

            Image("Text-WakeTimes3")
                .resizable()
                .aspectRatio(contentMode: .fit)

            Image("Text-Info1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .offset(x: 5, y:-50)

            Image("Text-Info2")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .offset(y: -120)
        }
    }
}

struct SleepTimeComp_Previews: PreviewProvider {
    static var previews: some View {
        SleepTimeComp(sleepTimeResults: """
                        6 sleep cycles: 10:00 pm
                        5 sleep cycles: 12:00 pm
                        4 sleep cycles: 1:00 pm
                        """)
            .environmentObject(Time())
            .background(Color("Dark-Purple"))
    }
}
