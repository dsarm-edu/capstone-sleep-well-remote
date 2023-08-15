//
//  TimeQuery.swift
//  capstone-sleep-well
//
//  Created by Danica Sarmiento on 7/27/23.
//

import SwiftUI

struct TimeQuery: View {
    
    @StateObject var time: Time
    
    @State var sleepTimeResults = ""

    @Binding public var path: NavigationPath
    
    @State var showTimes: Bool = false

    var body: some View {
        
        ZStack {
            
            Image("Text-TimeQuery")
                .resizable()
                .frame(width: 300, height: 100)
                .offset(y: -100)
            
            HStack {
                Spacer()
                
                DatePicker("Please enter a time", selection: $time.selectTime, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                    .datePickerStyle(.compact)
//                    .colorInvert()
                
                Spacer()
                
                Button {
                    time.calculateSleepTimes()
                    sleepTimeResults = time.sleepTimeResults
                    showTimes = true
                } label: {
                    Image("Button-Go")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:120.0, height: 35.0)
                }
                .navigationDestination(isPresented: $showTimes) {
                    SleepTimesView(sleepTimeResults: sleepTimeResults)
                }
                    Spacer()
            }
        }
    }


    struct TimeQuery_Previews: PreviewProvider {
        static var previews: some View {
            TimeQuery(time: Time(), path: .constant(NavigationPath()))
                        .environmentObject(Time())
                        .background(Image("Background-Main"))
        }
    }
}
