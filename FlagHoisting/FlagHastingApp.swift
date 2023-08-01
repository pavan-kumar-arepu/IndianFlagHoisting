//
//  FlagHastingApp.swift
//  FlagHasting
//
//  Created by Pavankumar Arepu on 28/07/23.
//

import SwiftUI

/**
 The main entry point for the FlagHastingApp.

 The `FlagHastingApp` serves as the main entry point for the app. It sets up the initial window group with the `ContentView` as the root view. The `ContentView` displays the flag hoisting animation, simulating the hoisting of the Indian flag using a flagpole, human image, and a globe icon. The animation involves layers of bricks forming the flagpole and snowflakes falling in the background, creating a winter ambiance.

 - Note: The `FlagHastingApp` follows the SwiftUI lifecycle and displays the `ContentView` as the main content of the app.

 - Author: [Arepu Pavan Kumar]
 */
@main
struct FlagHastingApp: App {
    var body: some Scene {
        WindowGroup {
            // Display the ContentView as the main content of the app
            ContentView()
        }
    }
}
