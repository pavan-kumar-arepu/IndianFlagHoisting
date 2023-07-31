//
//  Brick.swift
//  FlagHoisting
//
//  Created by Pavankumar Arepu on 31/07/23.
//

import Foundation
import SwiftUI

/**
 A SwiftUI view representing a brick element with custom strikes and text.

 The `Brick` view displays a brick-like element with custom strikes and the text "APK" on top of it. The brick is designed with a light gray background and a gray stroke around it, creating a distinctive appearance. The custom strikes add depth to the brick, and the "APK" text is displayed with a reduced font size and a transparent background.

 - Note: The `Brick` view is a reusable component suitable for various UI designs.

 - Important: The width of the brick is calculated as 1/6 of the screen width. Adjust the size as needed for your specific implementation.

 - Author: [Arepu Pavan Kumar]
 */
struct Brick: View {
    var body: some View {
        let screenWidth = UIScreen.main.bounds.width
        let brickW = screenWidth / 6 // Calculate brick width as 1/6 of the screen width

        ZStack {
            Rectangle()
                .fill(Color.red.opacity(0.5)) // Light gray background for the brick
                .frame(width: brickW, height: 25)
                .overlay(
                    // Custom strikes
                    ZStack {
                        ForEach(0..<4) { index in
                            Path { path in
                                let startY = CGFloat(index) * 6
                                path.move(to: CGPoint(x: 5, y: 5 + startY))
                                path.addLine(to: CGPoint(x: brickW - 5, y: 5 + startY))
                                path.animation(.easeInOut)
                            }
                            .stroke(Color.gray, lineWidth: 1.5)

                        }
                    }
                )
                .border(Color.gray, width: 1.5) // Gray stroke around the brick

            // Text "APK" on the brick with transparent background
            Text("APK")
                .font(.system(size: 12, weight: .bold)) // Reduced font size
                .foregroundColor(.white.opacity(0.5)) // Set text color to light white
                .background(Color.gray.opacity(0.5)) // Set background color with transparency
                .frame(width: brickW - 10, height: 20) // Adjust the frame size of the text
                .cornerRadius(5) // Add corner radius for a more elegant look
        }
    }
}

/// A preview provider for the Brick view.
struct Brick_preview: PreviewProvider {
    static var previews: some View {
        Brick()
    }
}
