//
//  DSSizing.swift
//  DesignSystem
//
//  Created by Raluca Bujor on 23.04.2026.
//

import Foundation

public struct DSSizing {
    // Semantic sizing - for specific use cases
    enum Card {
        static let imageWidth: CGFloat = 80
        static let imageHeight: CGFloat = 100
        static let stroke: CGFloat = 4
        static let shadowRadius: CGFloat = 7
    }
    
    enum Button {
        static let stroke: CGFloat = 1
    }
    
    enum Disclaimer {
        static let stroke: CGFloat = 0.5
    }
    
    enum ImageButton {
        static let iconSize: CGFloat = 24
    }
    
    enum Stepper {
        static let weight: CGFloat = 100
    }
    
    enum Gradient {
        static let radialOpacity: CGFloat = 0.14
        static let startRadius: CGFloat = 0
        static let endRadius: CGFloat = 160
        static let stroke: CGFloat = 3
        static let radius: CGFloat = 10
        static let shadowY: CGFloat = 4
    }
}
