//
//  SnowFlake.swift
//  FlagHasting
//
//  Created by Pavankumar Arepu on 30/07/23.
//

import Foundation
import SwiftUI


struct Snowflake: Identifiable {
    var id = UUID()
    var x: CGFloat
    var y: CGFloat
}
/**
 A SwiftUI view that displays a snowfall animation with falling snowflakes.
 
 The `SnowFlakeAnimation` view creates a snowfall effect by displaying a random number of snowflakes at random positions within the view's bounds.
 The snowflakes are represented by the system icon "snow." The animation starts automatically when the view appears on the screen, and the snowflakes
 continuously fall, wrapping around the screen when they reach the edges.
 
 - Note: The snowfall animation is powered by a custom `Coordinator` class, which synchronizes the snowflake updates with the screen refresh rate
 to ensure smooth and efficient animation.
 
 - Author: [Arepu Pavan Kumar]
 */
struct SnowFlakeAnimation: View {
    /// The state variable holding the array of `Snowflake` objects representing the falling snowflakes.
    @State private var snowflakes: [Snowflake] = []
    
    /// The size of each snowflake.
    let snowflakeSize: CGFloat = 20
    
    /**
     The body of the SnowFlakeAnimation view.
     
     The view utilizes a `GeometryReader` to access the view's size and then displays the falling snowflakes using a `ZStack`. Each snowflake is represented by the system icon "snow" and is randomly positioned within the view's bounds. The snowflakes' colors are randomized as well, creating a diverse snowfall effect.
     The `SnowFlakeAnimation` view calls the `addInitialSnowflakes(size:)` function on appearance to populate the snowflakes array with random initial positions and then starts the snowfall animation by calling the `startSnowfall()` function.
     */
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(snowflakes) { snowflake in
                    Image(systemName: "snow")
                        .resizable()
                        .frame(width: snowflakeSize, height: snowflakeSize)
                        .foregroundColor(Color.random())
                        .position(x: snowflake.x, y: snowflake.y)
                }
            }
            .onAppear {
                addInitialSnowflakes(size: geometry.size)
                startSnowfall()
            }
        }
    }

    /**
     Populates the snowflakes array with random initial positions.
     
     - Parameter size: The size of the view where the snowflakes are falling.
     */
    func addInitialSnowflakes(size: CGSize) {
        let numberOfSnowflakes = 100
        for _ in 0..<numberOfSnowflakes {
            let randomX = CGFloat.random(in: 0...size.width)
            let randomY = CGFloat.random(in: 0...size.height)
            snowflakes.append(Snowflake(x: randomX, y: randomY))
        }
    }

    /**
     Starts the snowfall animation by initializing the `Coordinator`.
     */
    func startSnowfall() {
        let coordinator = Coordinator(snowflakes: $snowflakes, size: UIScreen.main.bounds.size, snowflakeSize: snowflakeSize)
        coordinator.startSnowfall()
    }
}
