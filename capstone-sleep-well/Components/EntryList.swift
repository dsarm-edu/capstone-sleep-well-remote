//
//  EntryList.swift
//  capstone-sleep-well
//
//  Created by Danica Sarmiento on 7/31/23.
//

import SwiftUI

struct EntryList: View {
    
    var body: some View {
        ScrollView {
            EntryRow()
                .onTapGesture {
                    print("Row 1 tapped")
                }
            
            EntryRow()
                .onTapGesture {
                    print("Row 2 tapped")
                }
            EntryRow()
                .onTapGesture {
                    print("Row 3 tapped")
                }
            
        }
    }
}

struct EntryList_Previews: PreviewProvider {
    static var previews: some View {
        EntryList()
    }
}
