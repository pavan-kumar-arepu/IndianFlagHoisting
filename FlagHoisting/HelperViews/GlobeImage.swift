//
//  GlobeImage.swift
//  FlagHasting
//
//  Created by Pavankumar Arepu on 30/07/23.
//

import Foundation
import SwiftUI

struct GlobeImageView: View {
    var body: some View {
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundColor(.accentColor)
            .frame(width: 30, height: 30)
            .scaledToFit() // Maintain aspect ratio of the image
    }
}

struct GlobeImageView_preview: PreviewProvider {
    static var previews: some View {
        GlobeImageView()
    }
}
