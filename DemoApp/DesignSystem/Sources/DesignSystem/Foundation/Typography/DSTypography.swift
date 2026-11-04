//
//  DSTypography.swift
//  DesignSystem
//
//  Created by Raluca Bujor on 02.04.2026.
//

import SwiftUI

public struct DSTypography {
    // Display styles - for heroes and big statements
    public static let displayLarge: Font = AppFont.largeTitle.font(weight: .bold)
    public static let displayMedium: Font = AppFont.largeHeading.font(weight: .heavyBold)
    
    // Title styles - for title
    public static let title: Font = AppFont.title.font(weight: .regular)
    public static let titleBold: Font = AppFont.title.font(weight: .heavyBold)
    
    // Headline styles - for section headers
    public static let headlineHeavy: Font = AppFont.headline.font(weight: .heavyBold)
    public static let headlineBold: Font = AppFont.headline.font(weight: .bold)
    public static let headline: Font = AppFont.headline.font(weight: .light)
    
    // Body styles - for main content
    public static let bodyBold: Font = AppFont.body.font(weight: .bold)
    public static let body: Font = AppFont.body.font(weight: .regular)
    
    // Caption styles
    public static let captionBold: Font = AppFont.caption.font(weight: .bold)
    public static let caption: Font = AppFont.caption.font(weight: .light)
}
