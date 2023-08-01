//
//  Pole.swift
//  FlagHoisting
//
//  Created by Pavankumar Arepu on 01/08/23.
//

import Foundation
import SwiftUI

/**
 A SwiftUI view representing a flagpole with a finial (triangle tip) at the top.

 The `Pole` view displays a flagpole with a finial at the top, represented by a `Triangle` shape. The pole itself is a rectangular shape with a specified width and height.

 - Note: The `Pole` view can be used to represent a flagpole in various UI designs.

 - Important: Adjust the width and height of the flagpole and the finial (triangle tip) as needed for your specific implementation.

 - Author: [Arepu Pavan Kumar]
 */
struct Pole: View {
    var body: some View {
        let screenWidth = UIScreen.main.bounds.width
        let poleWidth = screenWidth / 40 // Adjust the width of the pole
        let poleHeight = UIScreen.main.bounds.height / 1.8 // Adjust the height of the pole

        VStack(spacing: 0) {
            // Small triangle closing tip (finial) for the top of the pole
            Triangle()
                .fill(Color.brown)
                .frame(width: poleWidth, height: poleWidth / 2) // Adjust the dimensions of the finial

            Rectangle()
                .fill(Color.brown) // Color of the flagpole
                .frame(width: poleWidth, height: poleHeight)
        }
    }
}

/// A preview provider for the Pole view.
struct Pole_preview : PreviewProvider {
    static var previews: some View {
        Pole()
    }
}
