//
//  DSCard.swift
//  DesignSystem
//
//  Created by Raluca Bujor on 02.04.2026.
//

import SwiftUI

public struct Card {
    public let id: UUID = UUID()
    public let image: Image
    public let title: String
    public let subtitle: String
    public let body: String
    public let button: String
    public let action: () -> Void
    
    public init(image: Image, title: String, subtitle: String, body: String, button: String, action: @escaping () -> Void) {
        self.image = image
        self.title = title
        self.subtitle = subtitle
        self.body = body
        self.button = button
        self.action = action
    }
}

public struct DSCard: View {
    // MARK: Public variables
    public let card: Card
    
    // MARK: Init
    public init(card: Card) {
        self.card = card
    }
    
    // MARK: Private variables
    @Environment(\.designTokens) private var tokens
    
    //  MARK: Body
    public var body: some View {
        VStack(spacing: tokens.spacing.md) {
            card.image
                .resizable()
                .accessibilityLabel(Text(card.title))
                .aspectRatio(contentMode: .fill)
                .frame(width: tokens.sizing.Card.imageWidth, height: tokens.sizing.Card.imageHeight)
                .clipShape(Circle())
                .overlay(Circle()
                    .stroke(tokens.colors.semantic.accentPrimary,
                            lineWidth: tokens.sizing.Card.stroke))
                .shadow(radius: tokens.sizing.Card.shadowRadius)
            
            VStack(spacing: tokens.spacing.xs) {
                Text(card.title)
                    .font(tokens.typography.titleBold)
                    .foregroundStyle(tokens.colors.semantic.textPrimary)
                
                Text(card.subtitle)
                    .font(tokens.typography.body)
                    .foregroundStyle(tokens.colors.semantic.textSecondary)
            }
            .accessibilityElement(children: .combine)
            .accessibilityAddTraits(.isHeader)
            
            Text(card.body)
                .font(tokens.typography.body)
                .foregroundStyle(tokens.colors.semantic.textSecondary)
                .multilineTextAlignment(.center)
            
            Button(action: { card.action() }) { // Primary action
                Text(card.button)
                    .font(tokens.typography.titleBold)
                    .foregroundColor(tokens.colors.semantic.textInverse)
                    .padding(.horizontal, tokens.spacing.lg)
                    .padding(.vertical, tokens.spacing.md)
                    .background(tokens.colors.semantic.accentPrimary)
                    .cornerRadius(tokens.spacing.xl)
            }
            .accessibilityLabel(Text(card.button))
            .accessibilityHint(Text("Opens details for \(card.title)"))
            .accessibilityAddTraits(.isButton)
        }
        .frame(maxWidth: .infinity)
        .padding(tokens.spacing.lg)
        .gradientCardBackground()
    }
}

private struct DSCardPreviewContent: View {
    var body: some View {
        ScrollView {
            DSCard(card: Card(image: Image("swiftui", bundle: .module),
                title: "Content injection",
                subtitle: "Flexible and composable components",
                body: "Give full control over what goes inside the component without inflating the initializer",
                button: "See more",
                action: {})) // Example
            
            DSCard(card: Card(image: Image("swiftui", bundle: .module),
                              title: "Behaviors and styles",
                              subtitle: "Make the initializer clean",
                              body: "Expose borders, background through custom modifiers that keep your API clean and mirror how SwiftUI views behave",
                              button: "See more",
                              action: {})) // Example
            
            DSCard(card: Card(image: Image("swiftui", bundle: .module),
                              title: "Result builders",
                              subtitle: "Add structured guidance",
                              body: "Add structure without sacrificing flexibility. Your complex foundation can make evolution elegant, not painful",
                              button: "See more",
                              action: {})) // Example
        }
        .padding()
    }
}

struct DSCard_LightMode_Previews: PreviewProvider {
    static var previews: some View {
        DSCardPreviewContent()
    }
}

struct DSCard_DarkMode_Previews: PreviewProvider {
    static var previews: some View {
        DSCardPreviewContent()
            .designSystem(brand: .berry,
                          scheme: .dark)
            .background(.black)
    }
}

struct DSCard_DynamicMode_Previews: PreviewProvider {
    static var previews: some View {
        DSCardPreviewContent()
            .designSystem(brand: .berry,
                          scheme: .light)
        .environment(\.sizeCategory, .accessibilityExtraExtraLarge)
        .environment(\.layoutDirection, .leftToRight)
    }
}

