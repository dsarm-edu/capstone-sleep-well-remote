//
//  Time.swift
//  capstone-sleep-well
//
//  Created by Danica Sarmiento on 8/8/23.
//

import Foundation
import SwiftUI

class Time: ObservableObject {

    @Published var sleepTimeResults: String = ""
    @Published var totalTimeSlept: String = ""

    @Published var selectTime = Date()
    @Published var wakeUpTime: Date?


    func calculateSleepTimes() {
        
        let currentDate = Date()
        let calendar = Calendar.current
        let selectedComponents = calendar.dateComponents([.hour, .minute], from: selectTime)
        let selectedHour = selectedComponents.hour ?? 0
        let selectedMinute = selectedComponents.minute ?? 0
        
        // Create a new date by setting the selected hour and minute to the current date
        var wakeUpDateComponents = calendar.dateComponents([.year, .month, .day], from: currentDate)
        wakeUpDateComponents.hour = selectedHour
        wakeUpDateComponents.minute = selectedMinute
        wakeUpTime = calendar.date(from: wakeUpDateComponents)
        
        // Calculates sleep cycles
        let nineHoursFifteenMinutes = TimeInterval(9 * 3600 + 15 * 60)
        let sevenHoursFortyFiveMinutes = TimeInterval(7 * 3600 + 45 * 60)
        let sixHoursFifteenMinutes = TimeInterval(6 * 3600 + 15 * 60)
        
        let sleepTime6Cycles = wakeUpTime?.addingTimeInterval(-nineHoursFifteenMinutes)
        let sleepTime5Cycles = wakeUpTime?.addingTimeInterval(-sevenHoursFortyFiveMinutes)
        let sleepTime4Cycles = wakeUpTime?.addingTimeInterval(-sixHoursFifteenMinutes)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        let wakeUpTimeString = formatter.string(from: wakeUpTime ?? currentDate)
        let sleepTime6CyclesString = formatter.string(from: sleepTime6Cycles ?? currentDate)
        let sleepTime5CyclesString = formatter.string(from: sleepTime5Cycles ?? currentDate)
        let sleepTime4CyclesString = formatter.string(from: sleepTime4Cycles ?? currentDate)
        
        sleepTimeResults = """
            6 cycles: \(sleepTime6CyclesString)
                
            5 cycles: \(sleepTime5CyclesString)
                
            4 cycles: \(sleepTime4CyclesString) 
            """
        
        print("Wake up time: \(wakeUpTimeString)")
        print("Sleep time (6 cycles): \(sleepTime6CyclesString)")
        print("Sleep time (5 cycles): \(sleepTime5CyclesString)")
        print("Sleep time (4 cycles): \(sleepTime4CyclesString)")
        
    }
    
    func calculateTimeSlept() {
        guard let wakeUpTime = wakeUpTime else {
            return
        }
        
        let calendar = Calendar.current
        let timeSleptInterval = wakeUpTime.timeIntervalSince(selectTime)
        let timeSleptComponents = calendar.dateComponents([.hour, .minute], from: timeSleptInterval > 0 ? selectTime : wakeUpTime, to: timeSleptInterval > 0 ? wakeUpTime : selectTime)
        
        let hoursSlept = timeSleptComponents.hour ?? 0
        let minutesSlept = timeSleptComponents.minute ?? 0
           
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        let wakeUpTimeString = formatter.string(from: wakeUpTime)
        
        totalTimeSlept = """
                   Wake up time: \(wakeUpTimeString)
                   Time Slept: \(hoursSlept) hours, \(minutesSlept) minutes
               """
           
        print("Wake up time: \(wakeUpTimeString)")
        print("Time Slept: \(hoursSlept) hours, \(minutesSlept) minutes")
           
       }
          
    }
