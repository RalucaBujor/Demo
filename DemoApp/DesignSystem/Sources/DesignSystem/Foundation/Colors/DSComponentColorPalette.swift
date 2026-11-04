//
//  DSComponentColorPalette.swift
//  DesignSystem
//
//  Created by Raluca Bujor on 01.08.2026.
//

import SwiftUI

internal protocol DSComponentColorPalette: SendableMetatype {
    // Button
    static var buttonPrimaryBackgroundDefault: Color { get }
    static var buttonPrimaryForegroundDefault: Color { get }

    static var buttonSecondaryBackgroundDefault: Color { get }
    static var buttonSecondaryForegroundDefault: Color { get }

    static var buttonDestructiveBackgroundDefault: Color { get }
    static var buttonBorderDefault: Color { get }

    // Alert
    static var alertDefaultBackground: Color { get }
    static var alertSuccessBackground: Color { get }
    static var alertErrorBackground: Color { get }
    static var alertWarningBackground: Color { get }
    static var alertInfoBackground: Color { get }

    // Disclaimer
    static var disclaimerBackground: Color { get }
    static var disclaimerForeground: Color { get }
    
    // Rating
    static var ratingBackgroundDefault: Color { get }
}
