//
//  Coordinator.swift
//  FlagHoisting
//
//  Created by Pavankumar Arepu on 01/08/23.
//

import Foundation
import SwiftUI
/**
 A coordinator class for managing the snowfall animation in a SwiftUI app.
 
 The `Coordinator` class utilizes a `CADisplayLink` to synchronize the snowflake animation with the display's refresh rate, ensuring smooth and efficient animations.
 
 The class is responsible for updating the positions of the snowflakes on the screen and wrapping them around the view's bounds when they move outside. The animation is controlled by adjusting the snowflake's `x` and `y` coordinates, simulating the falling effect.
 
 The `Coordinator` works with a binding to the array of `Snowflake` objects, allowing changes to the snowflake positions to be propagated to the view where the binding is used, enabling smooth real-time animation.
 
 - Note: The `Coordinator` class is part of a larger SwiftUI app that includes a virtual snowfall animation using custom `Snowflake` objects.
 
 - Author: [Your Name]
 */
class Coordinator {
    /// The display link used to synchronize the animation with the screen refresh rate.
    private var displayLink: CADisplayLink?
    
    /// A binding to the array of `Snowflake` objects representing the falling snowflakes.
    @Binding var snowflakes: [Snowflake]
    
    /// The size of the view where the snowflakes are falling.
    let size: CGSize
    
    /// The size of each snowflake.
    let snowflakeSize: CGFloat
    
    /**
     Initializes the coordinator for the snowfall animation.
     
     - Parameters:
        - snowflakes: A binding to the array of `Snowflake` objects representing the falling snowflakes.
        - size: The size of the view where the snowflakes are falling.
        - snowflakeSize: The size of each snowflake.
     */
    init(snowflakes: Binding<[Snowflake]>, size: CGSize, snowflakeSize: CGFloat) {
        _snowflakes = snowflakes
        self.size = size
        self.snowflakeSize = snowflakeSize
    }
    
    /**
     Starts the snowfall animation by initializing the display link.
     */
    func startSnowfall() {
        displayLink = CADisplayLink(target: self, selector: #selector(update))
        displayLink?.add(to: .main, forMode: .default)
    }
    
    /**
     Updates the position of the snowflakes on every screen refresh.
     
     The method is called by the `CADisplayLink` on every screen refresh, and it updates the positions of the snowflakes by modifying their `x` and `y` coordinates.
     Additionally, it applies wrapping behavior when the snowflakes move outside the view's bounds to ensure continuous falling.
     */
    @objc private func update() {
        updateSnowflakesPosition()
    }
    
    /**
     Updates the position of each snowflake in the `snowflakes` array.
     
     This private method is responsible for calculating the new position of each snowflake based on predefined speed and random wind factors.
     It then adjusts the snowflake's `x` and `y` coordinates accordingly, simulating the falling effect.
     If a snowflake moves beyond the view's bounds, it wraps around to the opposite side, allowing a seamless animation.
     */
    private func updateSnowflakesPosition() {
        snowflakes.indices.forEach { index in
            var snowflake = snowflakes[index]

            let speed: CGFloat = 5
            let wind: CGFloat = CGFloat.random(in: -0.5...0.5)

            let deltaY = speed
            let deltaX = wind * deltaY

            snowflake.x += deltaX
            snowflake.y += deltaY

            let maxX = size.width + snowflakeSize / 2
            if snowflake.x > maxX {
                snowflake.x = -snowflakeSize / 2
            }

            let maxY = size.height + snowflakeSize / 2
            if snowflake.y > maxY {
                snowflake.y = -snowflakeSize / 2
            }

            snowflakes[index] = snowflake
        }
    }
}
