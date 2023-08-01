//
//  EntryRow.swift
//  capstone-sleep-well
//
//  Created by Danica Sarmiento on 7/28/23.
//

import SwiftUI

struct EntryRow: View {
    
    var body: some View {
        
        HStack {
            Text("July 27, 2023")
                .foregroundColor(.white)
            
            Spacer()
            Button {
                print("Delete Button Pressed")
            } label: {
                Image(systemName: "trash")
                    .foregroundColor(.white)
            }
        }
        .frame(height: 35)
        .padding(.horizontal, 19)
        .padding(.vertical, 10)
        .background(Color("Light-Purple"))
        .padding(.horizontal, 35)
    }
}

struct EntryRow_Previews: PreviewProvider {
    static var previews: some View {
        List {
            EntryRow()
            EntryRow()
        }
    }
}
