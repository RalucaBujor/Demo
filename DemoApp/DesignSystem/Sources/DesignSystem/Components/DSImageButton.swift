//
//  DSImageButton.swift
//  DesignSystem
//
//  Created by Raluca Bujor on 03.04.2026.
//


import SwiftUI

public struct DSImageButton: View {
    // MARK: Public variables
    public let image: Image
    public let foreground: Color
    public let size: CGFloat?
    public let action: @MainActor () -> Void
    
    // MARK: Private variables
    @Environment(\.designTokens) private var tokens
    
    // MARK: Init
    public init(image: Image, foreground: Color, size: CGFloat? = nil, action: @MainActor @escaping () -> Void) {
        self.image = image
        self.foreground = foreground
        self.size = size
        self.action = action
    }
    
    // MARK: Body
    public var body: some View {
        Button(action: { // Tap action
            action()
        }, label: {
            let size = size ?? tokens.sizing.ImageButton.iconSize // Resolve icon size
            image
                .resizable()
                .scaledToFit()
                .foregroundStyle(foreground)
                .frame(width: size, height: size)
                .padding()
                .gradientCardBackground(cornerRadius: size/2)
                .font(tokens.typography.headline)
        })
        .buttonStyle(.plain)
    }
}

private struct DSImageButtonPreviewContent: View {
    @Environment(\.designTokens) private var tokens
    
    var body: some View {
        HStack(spacing: 16) {
            DSImageButton(image: tokens.icons.plus,
                          foreground: tokens.colors.semantic.textInverse,
                          action: { }) // Variant
            
            DSImageButton(image: Image(systemName: "checkmark.circle"),
                          foreground: tokens.colors.semantic.textInverse,
                          action: { }) // Variant
        }
        .padding()
    }
}

struct DSImageButton_LightMode_Previews: PreviewProvider {
    static var previews: some View {
        DSImageButtonPreviewContent()
    }
}

struct DSImageButton_DarkMode_Previews: PreviewProvider {
    static var previews: some View {
        DSImageButtonPreviewContent()
            .designSystem(
                brand: .berry,
                scheme: .dark
            )
            .background(.black)
    }
}

struct DSImageButton_DynamicMode_Previews: PreviewProvider {
    static var previews: some View {
        DSImageButtonPreviewContent()
            .designSystem(brand: .berry,
                          scheme: .light)
            .environment(\.sizeCategory, .accessibilityExtraExtraLarge)
            .environment(\.layoutDirection, .leftToRight)
    }
}
