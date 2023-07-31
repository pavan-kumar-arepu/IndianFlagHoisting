//
//  FireCracker.swift
//  FlagHasting
//
//  Created by Pavankumar Arepu on 30/07/23.
//

import Foundation
import SwiftUI

struct FirecrackerAnimation: View {
    @State private var animateFirecracker = false

    var body: some View {
        ZStack {
            if animateFirecracker {
                // Animate the firecrackers at random positions
                ForEach(0..<10) { _ in
                    CustomCracker()
                        .offset(x: CGFloat.random(in: 0...UIScreen.main.bounds.width),
                                y: CGFloat.random(in: 0...UIScreen.main.bounds.height))
                }
            }
        }
        .onAppear {
            // Start the animation when the view appears
            animateFirecracker.toggle()
        }
    }
}
struct CustomCracker: View {
    let crackerSize: CGFloat = 50
//    let circleSize: CGFloat = 20 // Adjust the size of the transparent circle
    @State private var showSticks = false // Flag to control the appearance of sticks

    var body: some View {
        ZStack {
            // First pair of sticks (random color)
            ForEach(0..<4) { index in
                Rectangle()
                    .fill(Color.random()) // Random color
                    .frame(width: 2, height: crackerSize / 2)
                    .offset(x: 0, y: showSticks ? -crackerSize / 4 : 0) // Start from the center of the cracker
                    .rotationEffect(.degrees(Double(index) * 45)) // Angle between sticks
                    .scaleEffect(showSticks ? 1.0 : 0.1) // Scale down the sticks initially
                    .opacity(showSticks ? 1.0 : 0) // Hide the sticks initially
            }
            
            // Second pair of sticks (random color)
            ForEach(0..<4) { index in
                Rectangle()
                    .fill(Color.random()) // Random color
                    .frame(width: 2, height: crackerSize / 2)
                    .offset(x: 0, y: showSticks ? crackerSize / 4 : 0) // Start from the center of the cracker
                    .rotationEffect(.degrees(Double(index) * 45)) // Angle between sticks
                    .scaleEffect(showSticks ? 1.0 : 0.1) // Scale down the sticks initially
                    .opacity(showSticks ? 1.0 : 0) // Hide the sticks initially
            }
            
//            // Transparent circle at the center of the cracker
//            Circle()
//                .fill(Color.clear)
//                .frame(width: circleSize, height: circleSize)
        }
        .onAppear {
            // Start the animation when the view appears
            withAnimation(Animation.easeInOut(duration: 0.5).delay(0.2)) {
                showSticks = true // Animate the sticks to appear from the center
            }
        }
    }
}


extension Color {
    static func random() -> Color {
        Color(red: .random(in: 0...1),
              green: .random(in: 0...1),
              blue: .random(in: 0...1))
    }
}

struct FirecrackerAnimation_Previews: PreviewProvider {
    static var previews: some View {
        FirecrackerAnimation()
    }
}
