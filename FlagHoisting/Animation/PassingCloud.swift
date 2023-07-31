//
//  PassingCloud.swift
//  FlagHoisting
//
//  Created by Pavankumar Arepu on 31/07/23.
//

import Foundation
import SwiftUI

/**
 Passing cloud Animation
 */
struct CloudAnimationView: View {
    let cloudImages: [Image] = [
        Image("cloud1"), // Replace "cloud1" with the actual name of your first cloud image
        Image("cloud2"), // Replace "cloud2" with the actual name of your second cloud image
    ]
    
    @State private var cloudOffsets: [CGFloat] = [0, 0]
    private let animationDuration: Double = 30 // Adjust the duration of the animation
    @State private var showWelcomeMessage = true
    
    var body: some View {
        ZStack {
            ForEach(cloudImages.indices, id: \.self) { index in
                cloudImages[index]
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100) // Adjust the height of the cloud images
                    .offset(x: cloudOffsets[index], y: -UIScreen.main.bounds.height * 0.25)
            }
        }
        .onAppear {
            animateClouds()
        }
    }
    
    /**
     Actual method which animates clouds
     */
    private func animateClouds() {
        for index in cloudOffsets.indices {
            let randomXOffset = CGFloat.random(in: UIScreen.main.bounds.width...UIScreen.main.bounds.width * 2)
            cloudOffsets[index] = randomXOffset
        }

        withAnimation(Animation.linear(duration: animationDuration).repeatForever(autoreverses: false)) {
            for index in cloudOffsets.indices {
                cloudOffsets[index] = -UIScreen.main.bounds.width // Move the clouds from right to left
            }
        }
    }

}

struct CloudAnimationView_Preview: PreviewProvider {
    static var previews: some View {
        CloudAnimationView()
    }
}
