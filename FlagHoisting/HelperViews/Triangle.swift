//
//  TriangleTopNotch.swift
//  FlagHasting
//
//  Created by Pavankumar Arepu on 30/07/23.
//

import Foundation
import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}


struct Pole: View {
    var body: some View {
        let screenWidth = UIScreen.main.bounds.width
        let poleWidth = screenWidth / 40 // Adjust the width of the pole
        let poleHeight = UIScreen.main.bounds.height / 1.8 // Adjust the height of the pole
        
        VStack(spacing: 0) {
            // Small triangle closing tip (finial) for the top of the pole
            Triangle()
                .fill(Color.brown)
                .frame(width: poleWidth, height: poleWidth / 2) // Adjust the dimensions of the finial
            
            Rectangle()
                .fill(Color.brown) // Color of the flagpole
                .frame(width: poleWidth, height: poleHeight)
        }
    }
}


struct Pole_preview : PreviewProvider {
    static var previews: some View {
        Pole()
    }
}
