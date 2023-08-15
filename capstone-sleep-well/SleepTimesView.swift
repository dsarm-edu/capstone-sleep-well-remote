//
//  WakeTimesView.swift
//  capstone-sleep-well
//
//  Created by Danica Sarmiento on 7/27/23.
//

import SwiftUI

struct SleepTimesView: View {
    
    @EnvironmentObject var time: Time
    var sleepTimeResults: String
        
    var body: some View {
        ZStack {

            Image("Background-Main")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()

            VStack {
                SleepTimeComp(sleepTimeResults: sleepTimeResults)
                    .offset(y: -60)
            }
            .offset(y: 70)
        }
    }
}

struct SleepTimesView_Previews: PreviewProvider {
    static var previews: some View {
        SleepTimesView(sleepTimeResults: """
                        6 sleep cycles: 10:00 pm
                        5 sleep cycles: 12:00 pm
                        4 sleep cycles: 1:00 pm
                        """)
            .environmentObject(Time())
    }
}
