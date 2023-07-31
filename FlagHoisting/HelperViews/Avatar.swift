//
//  Avatar.swift
//  FlagHasting
//
//  Created by Pavankumar Arepu on 30/07/23.
//

import Foundation
import SwiftUI


struct HumanView: View {
    var body: some View {
        Image("human") // Make sure "human.png" is added to the asset catalog
            .resizable()
//            .frame(width: 40, height: 80) // Adjust the size of the human image
            .scaledToFill() // Maintain aspect ratio of the image
    }
}

struct HumanView_Preview: PreviewProvider {
    static var previews: some View {
        HumanView()
    }
}
