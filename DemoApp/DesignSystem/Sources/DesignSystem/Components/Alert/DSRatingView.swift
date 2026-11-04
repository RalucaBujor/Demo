//
//  DSRatingView.swift
//  DesignSystem
//
//  Created by Raluca Bujor on 19.08.2026.
//

import SwiftUI

public struct DSRatingView: View {
    // MARK: Private variables
    @Binding private var rating: Int
    @Environment(\.designTokens) private var tokens
    
    // MARK: Init
    public init(rating: Binding<Int>) {
        self._rating = rating
    }
    
    // MARK: Body
    public var body: some View {
        HStack(spacing: tokens.spacing.sm) {
            ForEach(1...5, id: \.self) { value in
                Button {
                    rating = value
                } label: {
                    (value <= rating
                     ? tokens.icons.starFilled
                     : tokens.icons.starEmpty
                    )
                    .accessibilityHidden(true)
                }
                .buttonStyle(.plain)
            }
            .foregroundStyle(tokens.colors.components.ratingBackgroundDefault)
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
}

private struct DSRatingPreviewContent: View {
    @Environment(\.designTokens) private var tokens
    
    var body: some View {
        Group {
            VStack(spacing: tokens.spacing.xs) {
                DSRatingView(rating: .constant(1))
                DSRatingView(rating: .constant(2))
                DSRatingView(rating: .constant(3))
                DSRatingView(rating: .constant(4))
                DSRatingView(rating: .constant(5))
            }
        }
        .padding()
    }
}

struct DSRating_LightMode_Previews: PreviewProvider {
    static var previews: some View {
        DSRatingPreviewContent()
    }
}

struct DSRating_DarkMode_Previews: PreviewProvider {
    static var previews: some View {
        DSRatingPreviewContent()
        .designSystem(brand: .berry,
                      scheme: .dark)
        .background(.black)
    }
}

struct DSRating_DynamicMode_Previews: PreviewProvider {
    static var previews: some View {
         DSRatingPreviewContent()
        .environment(\.sizeCategory, .accessibilityExtraExtraLarge)
        .environment(\.layoutDirection, .leftToRight)
    }
}
