//
//  SceneDelegate.swift
//  FlagHoisting
//
//  Created by Pavankumar Arepu on 31/07/23.
//


import Foundation
import SwiftUI
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Create a new UIWindowScene with the scene parameter
        guard let windowScene = scene as? UIWindowScene else { return }

        // Create a new UIWindow using the windowScene
        let window = UIWindow(windowScene: windowScene)

        // Set the root view controller to the ContentView wrapped in a UIHostingController
        window.rootViewController = UIHostingController(rootView: ContentView())

        // Make the window visible
        self.window = window
        window.makeKeyAndVisible()
    }
}
