//
//  DSTag.swift
//  DesignSystem
//
//  Created by Raluca Bujor on 07.04.2026.
//


import SwiftUI

public struct DSTag: View {
    // MARK: Public variables
    public let image: Image
    public let text: String
    
    // MARK: Private variables
    @Environment(\.designTokens) private var tokens
    
    // MARK: Init
    public init(image: Image, text: String) {
        self.image = image
        self.text = text
    }
    
    // MARK: Body
    public var body: some View {
        if #available(iOS 26.0, *) {
            content
                .glassEffect(.regular,
                             in: RoundedRectangle(cornerRadius: tokens.cornerRadius.md)
                )
        } else {
            content
                .background(.ultraThinMaterial,
                            in: RoundedRectangle(cornerRadius: tokens.cornerRadius.md)
                )
        }
    }
    
    private var content: some View {
        VStack(spacing: tokens.spacing.xs) {
            image
            
            Text(text)
                .font(tokens.typography.captionBold)
                .lineLimit(1)
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel(text)
        .padding()
        .foregroundStyle(tokens.colors.semantic.textPrimary)
        .cornerRadius(tokens.cornerRadius.md)
        .frame(maxWidth: .infinity)
    }
}

private struct DSTagPreviewContent: View {
    var body: some View {
        VStack(spacing: 16) {
            DSTag(image: Image(systemName: "checkmark.circle"),
                          text: "Accessibility") // Variant
            
            DSTag(image: Image(systemName: "checkmark.circle"),
                  text: "Soucery") // Variant
            
            DSTag(image: Image(systemName: "checkmark.circle"),
                  text: "Previews") // Variant
        }
        .padding()
    }
}

struct DSTag_LightMode_Previews: PreviewProvider {
    static var previews: some View {
        DSTagPreviewContent()
    }
}

struct DSTag_DarkMode_Previews: PreviewProvider {
    static var previews: some View {
        DSTagPreviewContent()
            .designSystem(brand: .berry,
                          scheme: .dark)
            .background(.black)
    }
}

struct DSTag_DynamicMode_Previews: PreviewProvider {
    static var previews: some View {
        DSTagPreviewContent()
            .designSystem(brand: .berry,
                          scheme: .light)
            .environment(\.sizeCategory, .accessibilityExtraExtraLarge)
            .environment(\.layoutDirection, .leftToRight)
    }
}
