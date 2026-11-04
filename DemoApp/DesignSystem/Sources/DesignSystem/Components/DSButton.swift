//
//  DSButton.swift
//  DesignSystem
//
//  Created by Raluca Bujor on 02.04.2026.
//

import SwiftUI

public struct DSButton: View {
    // MARK: Public variables
    public enum ButtonType {
        case primary // Used for main actions, typically with a filled background
        case secondary // Used for alternative actions, typically with an outlined style
    }
    
    // MARK: Private variables
    private let type: ButtonType
    private let title: String
    private let action: () -> Void
    private var isDestructive: Bool = false
    
    // MARK: Init
    public init(
        type: ButtonType,
        title: String,
        action: @escaping () -> Void
    ) {
        self.type = type
        self.title = title
        self.action = action
    }
    
    public var body: some View {
        Button(title) {
            action()
        }
        .buttonStyle(DSButtonStyle(type: type,
                                   isDestructive: isDestructive))
    }
    
    public func destructive() -> DSButton {
        var copy = self
        copy.isDestructive = true
        return copy
    }
}

private struct DSButtonPreviewContent: View {
    @Environment(\.designTokens) private var tokens
    
    var body: some View {
        Group {
            VStack(spacing: tokens.spacing.xs) {
                DSButton(type: .primary, title: "Primary") {}
                DSButton(type: .secondary, title: "Secondary") {}
                DSButton(type: .primary, title: "Destructive") {}
                    .destructive()
            }
        }
        .padding()
    }
}

struct DSButton_LightMode_Previews: PreviewProvider {
    static var previews: some View {
        DSButtonPreviewContent()
    }
}

struct DSButton_DarkMode_Previews: PreviewProvider {
    static var previews: some View {
        DSButtonPreviewContent()
        .designSystem(brand: .berry,
                      scheme: .light)
        .background(.black)
    }
}

struct DSButton_DynamicMode_Previews: PreviewProvider {
    static var previews: some View {
         DSButtonPreviewContent()
        .environment(\.sizeCategory, .accessibilityExtraExtraLarge)
        .environment(\.layoutDirection, .leftToRight)
    }
}
