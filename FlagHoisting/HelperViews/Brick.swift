//
//  Brick.swift
//  FlagHoisting
//
//  Created by Pavankumar Arepu on 31/07/23.
//

import Foundation
import SwiftUI

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


struct Brick_preview: PreviewProvider {
    static var previews: some View {
        Brick()
    }
}
