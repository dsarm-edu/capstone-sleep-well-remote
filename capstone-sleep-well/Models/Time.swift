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

    @Published var selectTime = Date.now
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

        // Calculate sleep cycles
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

        print("Wake up time: \(wakeUpTimeString)")
        print("Sleep time (6 cycles): \(sleepTime6CyclesString)")
        print("Sleep time (5 cycles): \(sleepTime5CyclesString)")
        print("Sleep time (4 cycles): \(sleepTime4CyclesString)")


        //        1. Get the wake time (WT) from user - How to get that data from time picker?

        //        2. Once the "GO BUTTON" is pressed, it will calculate the sleep cycles and navigate to the "SleepTimesView"

        //        3. To calculate WT for 6 sleep cycles: WT - 9 hours, 15 minutes

        //        4. To calculate WT for 5 sleep cycles: WT - 7 hours, 45 minutes

        //        5. To calculate WT for 4 sleep cycles: WT - 6 hours, 15 minutes
        //        6. Navigate to next page with wake times for 4-6 sleep cycles

    }
}

