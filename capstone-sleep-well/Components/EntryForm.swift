//
//  NewEntry.swift
//  capstone-sleep-well
//
//  Created by Danica Sarmiento on 7/27/23.
//

import SwiftUI

struct EntryForm: View {
    
    @State private var selectDate = Date.now
    @State private var selectBedTime = Date.now
    @State private var selectWakeTime = Date.now
    @State private var notesField: String = ""

    var body: some View {

//        NavigationStack {
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
                   
                    TextField("", text: $notesField)
                        .foregroundColor(.white)
                        .frame(height: 150)
                        .padding(.horizontal, 19)
    //                    .padding(.vertical, 10)
                        .background(Color("Light-Purple"))
                        .padding(.horizontal, 35)
                }
                HStack {
                    Button {
                        print("Save Button Pressed")
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
//        }
    }
}


struct EntryForm_Previews: PreviewProvider {
    static var previews: some View {
        EntryForm()
    }
}
