//
//  DSCornerRadius.swift
//  DesignSystem
//
//  Created by Raluca Bujor on 02.04.2026.
//

import Foundation

public struct DSCornerRadius {
    // Everything derives from this
    private static let baseUnit: CGFloat = 4
    
    // Scaling - Powers of our base unit
    public static let xs = baseUnit * 1      // 4pt
    public static let sm = baseUnit * 2      // 8pt
    public static let md = baseUnit * 4      // 16pt
    public static let lg = baseUnit * 6      // 24pt
    public static let xl = baseUnit * 8      // 32pt
    public static let xxl = baseUnit * 12    // 48pt
    public static let xxxl = baseUnit * 16   // 64pt
}
