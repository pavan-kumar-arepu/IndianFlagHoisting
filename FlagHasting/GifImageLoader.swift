//
//  GifImageLoader.swift
//  FlagHasting
//
//  Created by Pavankumar Arepu on 30/07/23.
//

import Foundation
import SwiftUI
import UIKit


struct GIFImageView: UIViewRepresentable {
    @State private var isAnimating: Bool = true
    let gifName: String

    func makeCoordinator() -> Coordinator {
        Coordinator(isAnimating: $isAnimating, gifName: gifName)
    }

    func makeUIView(context: Context) -> UIImageView {
        let imageView = UIImageView()

        if let gifURL = Bundle.main.url(forResource: gifName, withExtension: "gif"),
           let imageData = try? Data(contentsOf: gifURL),
           let source = CGImageSourceCreateWithData(imageData as CFData, nil) {

            let count = CGImageSourceGetCount(source)
            var images: [UIImage] = []

            for i in 0..<count {
                if let cgImage = CGImageSourceCreateImageAtIndex(source, i, nil) {
                    images.append(UIImage(cgImage: cgImage))
                }
            }

            imageView.animationImages = images
            imageView.animationDuration = gifDuration(for: source)
        }

        return imageView
    }

    func updateUIView(_ uiView: UIImageView, context: Context) {
        if isAnimating {
            uiView.startAnimating()
        } else {
            uiView.stopAnimating()
        }
    }

    // Helper function to extract the GIF animation duration from CGImageSource
    func gifDuration(for source: CGImageSource) -> TimeInterval {
        let count = CGImageSourceGetCount(source)
        var totalDuration: TimeInterval = 0

        for i in 0..<count {
            if let properties = CGImageSourceCopyPropertiesAtIndex(source, i, nil) as? [String: Any],
               let gifProperties = properties[kCGImagePropertyGIFDictionary as String] as? [String: Any],
               let frameDuration = gifProperties[kCGImagePropertyGIFDelayTime as String] as? Double {
                totalDuration += frameDuration
            }
        }

        return totalDuration
    }

    class Coordinator: NSObject {
        @Binding var isAnimating: Bool

        init(isAnimating: Binding<Bool>, gifName: String) {
            self._isAnimating = isAnimating
            super.init()

            // Optionally, you can add logic here to stop animation when the view disappears
            NotificationCenter.default.addObserver(self, selector: #selector(stopAnimating), name: UIApplication.willResignActiveNotification, object: nil)
        }

        deinit {
            // Don't forget to remove the observer when the Coordinator is deallocated
            NotificationCenter.default.removeObserver(self)
        }

        @objc func stopAnimating() {
            isAnimating = false
        }
    }
}


// Preview the BrickView with the correct layout
struct GIFImageView_Previews: PreviewProvider {
    static var previews: some View {
        GIFImageView(gifName: "flag")
                   .aspectRatio(contentMode: .fit)
                   .frame(width: 200, height: 200)
    }
}
