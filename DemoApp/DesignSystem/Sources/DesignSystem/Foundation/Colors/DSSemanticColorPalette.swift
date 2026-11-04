//
//  DSSemanticColorPalette.swift
//  DesignSystem
//
//  Created by Raluca Bujor on 02.04.2026.
//

import SwiftUI

public protocol DSSemanticColorPalette: SendableMetatype {
    // Surface
    static var surfacePrimary: Color { get }
    static var surfaceSecondary: Color { get }
    static var surfaceInverse: Color { get }

    // Text
    static var textPrimary: Color { get }
    static var textSecondary: Color { get }
    static var textInverse: Color { get }
    static var textDisabled: Color { get }

    // Accent
    static var accentPrimary: Color { get }
    static var accentSecondary: Color { get }

    // Status
    static var statusSuccess: Color { get }
    static var statusError: Color { get }
    static var statusWarning: Color { get }
    static var statusInfo: Color { get }

    // Gradient
    static var gradientPrimaryFirst: Color { get }
    static var gradientPrimarySecond: Color { get }
    static var gradientPrimaryThird: Color { get }

    static var gradientAccent: Color { get }
    static var gradientRadial: Color { get }
}
