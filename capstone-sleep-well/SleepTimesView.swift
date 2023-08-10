//
//  WakeTimesView.swift
//  capstone-sleep-well
//
//  Created by Danica Sarmiento on 7/27/23.
//

import SwiftUI

struct SleepTimesView: View {
    
    var sleepTimeResults: String = ""
        
    var body: some View {
        ZStack {

            Image("Background-Main")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()

            VStack {
                SleepTimeComp(sleepTimeResults: sleepTimeResults)
            }
            .offset(y: 40)
        }
    }
}

struct SleepTimesView_Previews: PreviewProvider {
    static var previews: some View {
        SleepTimesView()
    }
}
