//
//  Text+DisclaimerStyle.swift
//  DesignSystem
//
//  Created by Raluca Bujor on 02.04.2026.
//

import SwiftUI

extension Text {
    func disclaimerStyle(with tokens: DesignTokens) -> some View {
        self
            .padding(.horizontal, tokens.spacing.md)
            .padding(.vertical, tokens.spacing.sm)
            .background(tokens.colors.components.disclaimerBackground)
            .cornerRadius(tokens.spacing.md)
            .overlay(
                RoundedRectangle(cornerRadius: tokens.spacing.md)
                    .stroke(
                        tokens.colors.components.disclaimerBackground,
                        lineWidth: tokens.sizing.Disclaimer.stroke
                    )
            )
            .font(tokens.typography.caption)
    }
}

struct TokenStyledText: View {
    @Environment(\.designTokens) private var tokens
    let text: Text
    
    var body: some View {
        text.disclaimerStyle(with: tokens)
    }
}
