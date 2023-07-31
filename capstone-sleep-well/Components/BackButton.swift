//
//  BackButton.swift
//  capstone-sleep-well
//
//  Created by Danica Sarmiento on 7/28/23.
//

import SwiftUI

struct BackButton: View {
    var body: some View {
        
        HStack {
            Button {
                print("Back Button")
            } label: {
                Image(systemName: "chevron.backward")
                    .foregroundColor(.white)
                    .font(.title3)
            }
        }
        .background(Color("Dark-Purple"))
        .offset(x: -170, y: 20)
        
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton()
            
    }
}
