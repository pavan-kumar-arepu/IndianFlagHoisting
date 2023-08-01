//
//  IndianFlag.swift
//  FlagHasting
//
//  Created by Pavankumar Arepu on 30/07/23.
//

import Foundation
import SwiftUI

/**
 A SwiftUI view representing the Indian national flag.

 The `IndianFlag` view displays the Indian national flag using an image named "IndiaFlag". The flag image is resizable and can be adjusted to the desired size. The position of the flag can also be customized by providing a `CGPoint` value.

 - Note: The `IndianFlag` view is designed to represent the Indian national flag and can be used as part of larger SwiftUI UI layouts.

 - Important: Replace "IndiaFlag" with the actual name of the image representing the Indian national flag.

 - Author: [Arepu Pavan Kumar]
 */
struct IndianFlag: View {
    /// The position of the Indian flag on the screen.
    var position: CGPoint

    var body: some View {
        Image("IndiaFlag")
            .resizable()
            .frame(width: 100, height: 60) // Adjust the width and height to your desired size
            .position(position) // Set the position of the Indian flag
    }
}

/// A preview provider for the IndianFlag view.
struct IndianFlag_Previews: PreviewProvider {
    static var previews: some View {
        IndianFlag(position: CGPoint(x: 100, y: 100))
    }
}
