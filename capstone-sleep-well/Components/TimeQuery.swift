//
//  TimeQuery.swift
//  capstone-sleep-well
//
//  Created by Danica Sarmiento on 7/27/23.
//

import SwiftUI

struct TimeQuery: View {
    
    @State private var sleepTimeResults = ""
    
    @ObservedObject var time: Time = Time()
    
    @State var selectTime = Date.now
    @State var wakeUpTime: Date?
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
                
                DatePicker("Please enter a time", selection: $selectTime, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                    .datePickerStyle(.compact)
                    .colorInvert()
                
                Spacer()
                
                Button {
                    time.calculateSleepTimes()
                    sleepTimeResults = time.sleepTimeResults
//                    path.append("SleepTimesView")
                    showTimes = true
                } label: {
                    Image("Button-Go")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:120.0, height: 40.0)
                }
                .navigationDestination(isPresented: $showTimes) {
                    SleepTimesView(sleepTimeResults: sleepTimeResults)
                }
                    Spacer()
            }
        }
    }


//        Print calculateSleepTimes function results to the SleepTimesView
//        Put calculateSleepTimes results in a variable


    struct TimeQuery_Previews: PreviewProvider {
        static var previews: some View {
            TimeQuery(path: .constant(NavigationPath()))
            //            .background(Image("Background-Main"))
        }
    }
}
