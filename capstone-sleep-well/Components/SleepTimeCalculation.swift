//
//  SleepTimeCalculation.swift
//  capstone-sleep-well
//
//  Created by Danica Sarmiento on 7/28/23.
//

import SwiftUI

struct SleepTimeCalculation: View {
    var body: some View {
        
        HStack {
            Text("zzz...")
                .foregroundColor(.gray)
            Spacer()
        }
        .frame(height: 35)
        .padding(.horizontal, 19)
        .padding(.vertical, 10)
        .background(Color("Light-Purple"))
        .padding(.horizontal, 35)
    }
}

struct SleepTimeCalculation_Previews: PreviewProvider {
    static var previews: some View {
        SleepTimeCalculation()
    }
}
