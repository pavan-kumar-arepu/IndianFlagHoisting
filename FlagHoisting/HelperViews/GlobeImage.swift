//
//  GlobeImage.swift
//  FlagHasting
//
//  Created by Pavankumar Arepu on 30/07/23.
//

import Foundation
import SwiftUI

/**
 A SwiftUI view representing a globe icon image.

 The `GlobeImageView` view displays a globe icon using the system name "globe" from SF Symbols.
 The icon is resizable and can be adjusted to the desired size. The image scale and foreground color can also be customized.

 - Note: The `GlobeImageView` view is a reusable component suitable for displaying a globe icon in various parts of the app.

 - Author: [Arepu Pavan Kumar]
 */
struct GlobeImageView: View {
    var body: some View {
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundColor(.accentColor)
            .frame(width: 30, height: 30)
            .scaledToFit() // Maintain the aspect ratio of the image
    }
}

/// A preview provider for the GlobeImageView view.
struct GlobeImageView_preview: PreviewProvider {
    static var previews: some View {
        GlobeImageView()
    }
}
