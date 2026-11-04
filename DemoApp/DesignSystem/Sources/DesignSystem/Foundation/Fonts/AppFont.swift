//
//  AppFont.swift
//  DesignSystem
//
//  Created by Raluca Bujor on 02.04.2026.
//

import SwiftUI

enum AppFont {
    case largeTitle
    case largeHeading
    case title
    case headline
    case body
    case caption

    func font(weight: AppFontWeight = .regular) -> Font {
        let name = weight.fontName

        switch self {
        case .largeTitle:
            return .custom(name, size: 60, relativeTo: .largeTitle)
        case .largeHeading:
            return .custom(name, size: 40, relativeTo: .largeTitle)
        case .title:
            return .custom(name, size: 20, relativeTo: .title)
        case .headline:
            return .custom(name, size: 20, relativeTo: .headline)
        case .body:
            return .custom(name, size: 16, relativeTo: .body)
        case .caption:
            return .custom(name, size: 16, relativeTo: .caption)
        }
    }
}

enum AppFontWeight {
    case light
    case regular
    case bold
    case heavyBold

    var fontName: String {
        switch self {
        case .light: return "RobotoCondensed-Light"
        case .regular: return "RobotoCondensed-Medium"
        case .bold: return "RobotoCondensed-SemiBold"
        case .heavyBold:  return "RobotoCondensed-ExtraBold"
        }
    }
}
