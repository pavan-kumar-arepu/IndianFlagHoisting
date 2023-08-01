//
//  ContentView.swift
//  FlagHoisting
//
//  Created by Pavankumar Arepu on 01/08/23.
//

import Foundation
import SwiftUI

struct ContentView: View {
    @State private var isFlagHoistingDone = false
    
    var body: some View {
        ZStack {
            FlagHosting(screenWidth: UIScreen.main.bounds.width, screenHeight: UIScreen.main.bounds.height, isFlagHastingDone: $isFlagHoistingDone)
        }
    }
}

struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
