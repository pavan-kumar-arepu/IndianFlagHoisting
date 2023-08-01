//
//  Brick.swift
//  FlagHasting
//
//  Created by Pavankumar Arepu on 30/07/23.
//

import Foundation
import SwiftUI

/**
 A SwiftUI view representing a flag hoisting animation.

 The `FlagHosting` view displays an animation that simulates the hoisting of the Indian flag. The animation involves a flagpole with layers of bricks, an image of a human holding the flag, and a globe icon at the top of the pole. Snowflakes fall gently in the background, creating a winter ambiance.

 - Note: The `FlagHosting` view is a dynamic animation and requires user interaction (tapping) to simulate the hoisting action. The animation sequence starts with a welcome message, followed by the movement of the human image to its target position. Once the human image reaches the target position, the Indian flag is hoisted, and snowflakes start falling in the background.

 - Important: Ensure that all the required assets, including images for the human, Indian flag, and globe icon, are available in the asset catalog before using the `FlagHosting` view.

 - Author: [Arepu Pavan Kumar]
 */
struct FlagHosting: View {
    @State private var humanPosition: CGPoint = CGPoint(x: 180, y: 585) // Initial position
    @State private var targetPosition: CGPoint = CGPoint(x: 180, y: 585) // Current target position
    @State private var showIndianFlag: Bool = false // Add this line to create the state variable
    @State private var globeImagePosition: CGPoint
    @State private var showglobeImage: Bool = true
    @State private var showSnowFlakeAnimation = false // New @State variable
    @State private var snowflakes: [Snowflake] = []
    @State private var stopFlagMoving: Bool = true
    @State private var showWelcomeMessage = true // State variable to control the visibility of the welcome message

    let snowflakeSize: CGFloat = 20
    
    let screenWidth: CGFloat
    let screenHeight: CGFloat
    @Binding var isFlagHastingDone: Bool // Binding to control visibility of SnowFlakeAnimation
    
    init(screenWidth: CGFloat, screenHeight: CGFloat, isFlagHastingDone: Binding<Bool>) {
        self.screenWidth = screenWidth
        self.screenHeight = screenHeight
        _globeImagePosition = State(initialValue: CGPoint(x: 10, y: 600))
        _isFlagHastingDone = isFlagHastingDone
    }
    
    private var brickWidth: CGFloat {
        UIScreen.main.bounds.width / 6 // Calculate brick width as 1/6 of the screen width
    }

    // Function to update the target position based on the current position
    private func updateTargetPosition() {
        let screenWidth = UIScreen.main.bounds.width
        let newY = targetPosition.y - 25 // 25 is brick height
        let humanXMove = screenWidth / 6 // Calculate brick width as 1/6 of the screen width
        let newX = targetPosition.x - (humanXMove/2)
        
        if (newY < 500) {
                targetPosition = CGPoint(x: newX - 30 , y: newY + 25) // Move to 3rd layer
                shiftGlobe()
                stopFlagMoving = false
        } else {
            targetPosition = CGPoint(x: newX , y: newY) // Move to 3rd layer
        }
        print(newX, newY)
    }

    private func shiftGlobe() {
        // Animate the AppleImage to the top of the pole
        withAnimation(.easeInOut(duration: 10.0)) {
            globeImagePosition = CGPoint(
                x: globeImagePosition.x,
                y: globeImagePosition.y - (UIScreen.main.bounds.height / 2))
            showglobeImage = true
        }
        
        // Delay the opening of the flag after AppleImage reaches the top of the pole
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            // Perform any action or animation to open the flag here
            // You can display the Indian flag gif or perform any other animation
            // For the purpose of this example, let's just show the IndianFlag view at the appleImagePosition
            
            // Assuming you have an @State variable to control the flag display
            showglobeImage = false
            showIndianFlag = true
            // Set the flag hasting state variable to true
            isFlagHastingDone = true
            
            // Show the SnowFlakeAnimation when the flag animation is done
            showSnowFlakeAnimation = true
        }
    }
    
    func addInitialSnowflakes(size: CGSize) {
        let numberOfSnowflakes = 100
        for _ in 0..<numberOfSnowflakes {
            let randomX = CGFloat.random(in: 0...size.width)
            let randomY = CGFloat.random(in: 0...size.height)
            snowflakes.append(Snowflake(x: randomX, y: randomY))
        }
    }

    func startSnowfall() {
        let coordinator = Coordinator(snowflakes: $snowflakes, size: UIScreen.main.bounds.size, snowflakeSize: snowflakeSize)
        coordinator.startSnowfall()
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.white]),
                               startPoint: .top,
                               endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
                
                CloudAnimationView()
                
                ForEach(snowflakes) { snowflake in
                    Image(systemName: "snow")
                        .resizable()
                        .frame(width: snowflakeSize, height: snowflakeSize)
                        .foregroundColor(Color.random())
                        .background(Color.clear)
                        .position(x: snowflake.x, y: snowflake.y)
                }
                
                if showWelcomeMessage {
                // Show the welcome message here (code from your previous example)
                    Text("🇮🇳 Celebrating upcoming India's 77th Independence Day with pride! 🇮🇳")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.purple)
                        .padding()
                        .background(Color.black.opacity(0.8))
                        .cornerRadius(10)
                } else {
                    VStack(spacing: 0) {
                        Spacer() // Add spacer to separate the layers
                        
                        if showIndianFlag {
                            IndianFlag(position: CGPoint(x: globeImagePosition.x + brickWidth*4 - 20 , y: globeImagePosition.y + 40))
                        }
                        
                        // AppleImage
                        GlobeImageView()
                            .offset(x: globeImagePosition.x, y: globeImagePosition.y)
                            .animation(.easeInOut) // Add animation to the movement
                            .opacity(showglobeImage ? 1 : 0)
                        
                        // Add the human view below the layers and set its position
                        Image("human")
                            .resizable()
                            .scaledToFit() // Keep the image with correct aspect ratio and small size
                            .frame(width: 60, height: 120) // Set the desired size of the human image
                            .offset(x: humanPosition.x, y: humanPosition.y)
                            .animation(.easeInOut) // Add animation to the movement
                        
                        Pole()
                        
                        // Second Layer of Bricks
                        HStack(spacing: 0) {
                            //HalfBrick() // Add the HalfBrick at the beginning of the second layer
                            ForEach(0..<3, id: \.self) { brickIndex in
                                Brick()
                            }
                        }
                        
                        // Second Layer of Bricks
                        HStack(spacing: 0) {
                            //HalfBrick() // Add the HalfBrick at the beginning of the second layer
                            ForEach(0..<4, id: \.self) { brickIndex in
                                Brick()
                            }
                        }
                        
                        // Second Layer of Bricks
                        HStack(spacing: 0) {
                            //HalfBrick() // Add the HalfBrick at the beginning of the second layer
                            ForEach(0..<5, id: \.self) { brickIndex in
                                Brick()
                            }
                        }
                        
                        // First Layer of Bricks
                        HStack(spacing: 0) {
                            ForEach(0..<6, id: \.self) { brickIndex in
                                Brick()
                            }
                        }
                    }
                    .frame(maxHeight: .infinity) // Make sure the VStack occupies the full height
                    .onTapGesture {
                        if stopFlagMoving {
                            updateTargetPosition() // Update the target position on each tap
                        }
                        humanPosition = targetPosition // Animate the human to the target position
                        if isFlagHastingDone {
                            addInitialSnowflakes(size: geometry.size)
                            startSnowfall()
                        }
                    }
                }
            }
        }.onAppear{
            delayExecution()
        }
    }
    
    private func delayExecution() {
           DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
               // Code inside this block will be executed after a delay of 5 seconds
               // You can add your desired code here
               showWelcomeMessage = false
           }
       }
}
