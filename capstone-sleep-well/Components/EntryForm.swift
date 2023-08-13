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
    
    let db = Firestore.firestore()
    
    
    //    We need something to hold on to entry so view can hold in that data
    //    pass in same entry to form
    //    init method that has a conditional if we're given an entry/value, use the values from entry
    
    //    @State var selectDate: Date = Date.now
    
    //    assignment will happen inside init function
    //    @State var selectBedTime = Date.now
    //    @State var selectWakeTime = Date.now
    //    @State var notes: String = ""

//        if entryID exists, retrieve that entry

//        else: set the entry to default values
//    init(id: String?) {
//
//        if let id = entry?.id {
//            let docRef = db.collection("entries").document(id)
//
//            docRef.getDocument { (document, error) in
//                if let document = document, document.exists {
//                    let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
//                    print("Document data: \(dataDescription)")
//                } else {
//                    print("Document does not exist")
//                }
//            }
//        } else {
//            self._selectDate = State(initialValue: Date())
//            self._selectBedTime = State(initialValue: Date())
//            self._selectWakeTime = State(initialValue: Date())
//            self._notes = State(initialValue: "")
//        }
//    }
        
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
                            //                        fire off network call
                            //                        How do I call updateEntry here?
                            entryManager.addEntry(date: selectDate, sleepTime: selectBedTime, wakeTime: selectWakeTime, notes: notes)
                            //                        Need some kind of attribute that represents an entry? look at that variable does it exist?
                            //                        multiple conditionals, one in init then another one here
                            //                        unwrap
                            //
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
                EntryForm(selectDate: Date(), selectBedTime: Date(), selectWakeTime: Date(), notes: "NOTES")
                    .environmentObject(EntryManager())
            }
        }

