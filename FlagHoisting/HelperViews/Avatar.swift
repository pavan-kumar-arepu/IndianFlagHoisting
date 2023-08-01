//
//  Avatar.swift
//  FlagHasting
//
//  Created by Pavankumar Arepu on 30/07/23.
//

import Foundation
import SwiftUI

/**
 A SwiftUI view representing a human image.

 The `HumanView` view displays a human image named "human.png" from the asset catalog. The image is resizable and scaled to fill the available space, maintaining its aspect ratio.

 - Note: The `HumanView` view is designed to represent a human image and can be used as part of larger SwiftUI UI layouts.

 - Important: Make sure to add the "human.png" image to the asset catalog before using the `HumanView` view.

 - Author: [Arepu Pavan Kumar]
 */
struct HumanView: View {
    var body: some View {
        Image("human") // Make sure "human.png" is added to the asset catalog
            .resizable()
            .scaledToFill() // Maintain the aspect ratio of the image
    }
}

/// A preview provider for the HumanView view.
struct HumanView_Preview: PreviewProvider {
    static var previews: some View {
        HumanView()
    }
}
