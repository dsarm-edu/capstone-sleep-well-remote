//
//  NewEntry.swift
//  capstone-sleep-well
//
//  Created by Danica Sarmiento on 7/27/23.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct EntryForm: View {
    
    @EnvironmentObject var entryManager: EntryManager
    
    var entry: Entry?
    
    @State var selectDate: Date
    @State var selectBedTime: Date
    @State var selectWakeTime: Date
    @State var notes: String
    
    init(entry: Entry? = nil) {
            self.entry = entry
            
            if let entry = entry {
                _selectDate = State(initialValue: entry.date)
                _selectBedTime = State(initialValue: entry.sleepTime)
                _selectWakeTime = State(initialValue: entry.wakeTime)
                _notes = State(initialValue: entry.notes)
            } else {
                let currentDate = Date()
                _selectDate = State(initialValue: currentDate)
                _selectBedTime = State(initialValue: currentDate)
                _selectWakeTime = State(initialValue: currentDate)
                _notes = State(initialValue: "")
            }
        }
    let db = Firestore.firestore()
 
            var body: some View {
                
                VStack {
                    HStack {
                        DatePicker("Please enter a time", selection: $selectDate, displayedComponents: .date)
                            .labelsHidden()
                            .datePickerStyle(.compact)
                            .colorInvert()
                        
                        Spacer()
                    }
                    .frame(height: 35)
                    .padding(.horizontal, 19)
                    .padding(.vertical, 10)
                    .background(Color("Light-Purple"))
                    .padding(.horizontal, 35)
                    
                    HStack {
                        Text("What time did you go to bed?")
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        DatePicker("Please enter a time", selection: $selectBedTime, displayedComponents: .hourAndMinute)
                            .labelsHidden()
                            .datePickerStyle(.compact)
                            .colorInvert()
                    }
                    .frame(height: 35)
                    .padding(.horizontal, 19)
                    .padding(.vertical, 10)
                    .background(Color("Light-Purple"))
                    .padding(.horizontal, 35)
                    
                    HStack {
                        Text("What time did you wake up?")
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        DatePicker("Please enter a time", selection: $selectWakeTime, displayedComponents: .hourAndMinute)
                            .labelsHidden()
                            .datePickerStyle(.compact)
                            .colorInvert()
                    }
                    .frame(height: 35)
                    .padding(.horizontal, 19)
                    .padding(.vertical, 10)
                    .background(Color("Light-Purple"))
                    .padding(.horizontal, 35)
                    
                    HStack {
                        SleepTimeCalculation()
                    }
                    
                    HStack {
                        
                        TextField("", text: $notes)
                            .foregroundColor(.white)
                            .frame(height: 150)
                            .padding(.horizontal, 19)
                        //                    .padding(.vertical, 10)
                            .background(Color("Light-Purple"))
                            .padding(.horizontal, 35)
                    }
                    HStack {
                        Button {
                            if let existingEntry = entry {
                                entryManager.updateEntry(toUpdate: existingEntry, date: selectDate, sleepTime: selectBedTime, wakeTime: selectWakeTime, notes: notes)
                            } else {
                                entryManager.addEntry(date: selectDate, sleepTime: selectBedTime, wakeTime: selectWakeTime, notes: notes)
                            }
                        } label: {
                            Text("Save")
                                .foregroundColor(.white)
                                .frame(maxWidth: 80)
                        }
                    }
                    .padding(.horizontal, 19)
                    .padding(.vertical, 10)
                    .background(Color("Light-Purple"))
                    .padding(.horizontal, 35)
                }
            }
        }
        
        
struct EntryForm_Previews: PreviewProvider {
    static var previews: some View {
        let entry = Entry(date: Date(), sleepTime: Date(), wakeTime: Date(), notes: "Sample Notes")
        return Group {
            EntryForm(entry: entry)
                .environmentObject(EntryManager())
            
            EntryForm() // Defaults with current time and date
                .environmentObject(EntryManager())
        }
    }
}

