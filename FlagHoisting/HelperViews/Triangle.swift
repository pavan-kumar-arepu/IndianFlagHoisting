//
//  TriangleTopNotch.swift
//  FlagHasting
//
//  Created by Pavankumar Arepu on 30/07/23.
//

import Foundation
import SwiftUI

/**
 A custom SwiftUI shape representing a triangle.

 The `Triangle` shape is used to create a triangle with three points, forming a closed path. It is commonly used as the finial (closing tip) for the top of the flagpole.

 - Author: [Arepu Pavan Kumar]
 */
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
