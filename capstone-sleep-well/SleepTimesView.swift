//
//  WakeTimesView.swift
//  capstone-sleep-well
//
//  Created by Danica Sarmiento on 7/27/23.
//

import SwiftUI

struct SleepTimesView: View {
    var body: some View {
        ZStack {

            Image("Background-Main")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()

            
            VStack {
                HomeHeader()
                    .offset(y: 20)
                SleepTimeComp()

            }
        }
    }
}

struct SleepTimesView_Previews: PreviewProvider {
    static var previews: some View {
        SleepTimesView()
    }
}
