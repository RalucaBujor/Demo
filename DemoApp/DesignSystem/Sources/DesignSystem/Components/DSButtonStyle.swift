//
//  DSButtonStyle.swift
//  DesignSystem
//
//  Created by Raluca Bujor on 02.04.2026.
//

import SwiftUI

struct DSButtonStyle: ButtonStyle {
    // MARK: Private variables
    private let type: DSButton.ButtonType
    private let isDestructive: Bool
    private let buttonCornerRadius: CGFloat? = nil
    @Environment(\.designTokens) private var tokens
    
    // MARK: Init
    init(type: DSButton.ButtonType,
         isDestructive: Bool = false) {
        self.type = type
        self.isDestructive = isDestructive
    }
    
    // MARK: Body
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(tokens.spacing.md)
            .font(tokens.typography.headlineHeavy)
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .foregroundColor(foregroundColor)
            .cornerRadius(buttonCornerRadius ?? tokens.cornerRadius.md)
            .opacity(configuration.isPressed ? 0.8 : 1.0)
    }
    
    var backgroundColor: Color {
        guard !isDestructive else {
            return tokens.colors.components.buttonDestructiveBackgroundDefault
        }
        switch type {
        case .primary:
            return tokens.colors.components.buttonPrimaryBackgroundDefault
        case .secondary:
            return tokens.colors.components.buttonSecondaryBackgroundDefault
        }
    }
    
    var foregroundColor: Color {
        switch type {
        case .primary:
            return tokens.colors.components.buttonPrimaryForegroundDefault
        case .secondary:
            return tokens.colors.components.buttonSecondaryForegroundDefault
        }
        
        
    }
    
    private var overlayColor: Color {
        return tokens.colors.components.buttonBorderDefault
    }
}
