//
//  TimeQuery.swift
//  capstone-sleep-well
//
//  Created by Danica Sarmiento on 7/27/23.
//

import SwiftUI

struct TimeQuery: View {
    @State var selectTime = Date.now
    var body: some View {
        ZStack {
                VStack {
                
                    Image("Text-TimeQuery")
                        .resizable()
                        .frame(width: 300, height: 100)
//                        .offset(y:280)

                    HStack {
                        Spacer()
                        
                        
                        DatePicker("Please enter a time", selection: $selectTime, displayedComponents: .hourAndMinute)
                            .labelsHidden()
                            .datePickerStyle(.compact)
                            .colorInvert()
     
                        Spacer()
                        
                        Button {
                            goButton()
                        } label: {
                            Image("Button-Go")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width:120.0, height: 40.0)
                        }
                        Spacer()
                    }


                }

        }
        
    }
    
    func goButton() {
        
        print("Go button")
    }
    }


struct TimeQuery_Previews: PreviewProvider {
    static var previews: some View {
        TimeQuery()
            .background(Color("Dark-Purple"))
    }
}
