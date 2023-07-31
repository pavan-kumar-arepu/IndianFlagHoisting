//
//  IndianFlag.swift
//  FlagHasting
//
//  Created by Pavankumar Arepu on 30/07/23.
//

import Foundation
import SwiftUI

struct IndianFlag: View {
    var position: CGPoint
    
    var body: some View {
        Image("IndiaFlag")
            .resizable()
            .frame(width: 100, height: 60) // Adjust the width and height to your desired size
            .position(position) // Set the position of the Indian flag
    }
}

// Preview the BrickView with the correct layout
struct IndianFlag_Previews: PreviewProvider {
    static var previews: some View {
        IndianFlag(position: CGPoint(x: 100, y: 100))
    }
}
