//
//  AlertType.swift
//  DesignSystem
//
//  Created by Raluca Bujor on 03.04.2026.
//

import SwiftUI

/// Represents the type of alert to display, determining its color, icon, and accessibility hint.
public enum AlertType: String {
    case success
    case warning
    case error
    case info
    
    func tintColor(with tokens: DesignTokens) -> Color {
        switch self {
        case .success: return tokens.colors.components.alertSuccessBackground
        case .warning: return tokens.colors.components.alertWarningBackground
        case .error: return tokens.colors.components.alertErrorBackground
        case .info: return tokens.colors.components.alertInfoBackground
        }
    }

    var accessibilityHint: String {
        switch self {
        case .info:
            return "This is an informational message"
        case .success:
            return "This is a success message"
        case .warning:
            return "This is a warning message"
        case .error:
            return "This is an error message"
        }
    }
    
    func icon(with tokens: DesignTokens) -> Image {
        switch self {
        case .info:
            return tokens.icons.infoCircle
        case .success:
            return tokens.icons.checkmark
        case .warning:
            return tokens.icons.exclamationMarkFilled
        case .error:
            return tokens.icons.exclamationMark
        }
    }
    
    var iconAccessibilityLabel: String {
        switch self {
        case .info:
            return "Info"
        case .success:
            return "Success"
        case .warning:
            return "Warning"
        case .error:
            return "Error"
        }
    }
}
