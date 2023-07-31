//
//  PassingCloud.swift
//  FlagHoisting
//
//  Created by Pavankumar Arepu on 31/07/23.
//

import Foundation
import SwiftUI

/**
 A SwiftUI view that displays a passing cloud animation with moving cloud images.

 The `CloudAnimationView` creates a continuous animation of passing clouds across the screen. It utilizes an array of cloud images and animates their movement from right to left, giving the illusion of clouds passing by.

 - Note: To use this view, ensure that you have the cloud images named "cloud1" and "cloud2" (or modify the `cloudImages` array to include the actual names of your cloud images).

 - Important: Adjust the `animationDuration` property to set the duration of the cloud animation.

 - Author: [Arepu Pavan Kumar]
 */
struct CloudAnimationView: View {
    /// An array of cloud images used in the animation.
    let cloudImages: [Image] = [
        Image("cloud1"), // Replace "cloud1" with the actual name of your first cloud image
        Image("cloud2"), // Replace "cloud2" with the actual name of your second cloud image
    ]

    /// The horizontal offsets for the cloud images to create the moving effect.
    @State private var cloudOffsets: [CGFloat] = [0, 0]

    /// The duration of the cloud animation.
    private let animationDuration: Double = 30 // Adjust the duration of the animation

    /// A state variable to control the visibility of a welcome message (not used in the animation).
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
     Animates the clouds to create the passing cloud effect.
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

/// A preview provider for the CloudAnimationView.
struct CloudAnimationView_Preview: PreviewProvider {
    static var previews: some View {
        CloudAnimationView()
    }
}
