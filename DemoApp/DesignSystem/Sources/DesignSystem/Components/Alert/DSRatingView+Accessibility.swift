//
//  DSRatingView+Accessibility.swift
//  DesignSystem
//
//  Created by Raluca Bujor on 06.04.2026.
//

import SwiftUI
import UIKit

private struct RatingSummaryAccessibilityModifier: ViewModifier {
    // MARK: Variables
    let hint: String
    @Binding var rating: Int
    let onIncrement: (() -> Void)?
    let onDecrement: (() -> Void)?
    
    // MARK: BodydynamicTypeSize
    func body(content: Content) -> some View {
        content
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Learning rating")
            .accessibilityValue("\(rating) out of 5")
            .accessibilityHint(Text(hint))
            .accessibilityAdjustableAction { direction in
                switch direction {
                case .increment:
                    onIncrement?()
                case .decrement:
                    onDecrement?()
                default:
                    break
                }
            }
            .accessibilityRespondsToUserInteraction(true)
    }
}

extension View {
    public func ratingAccessibility(hint: String,
                                    rating: Binding<Int>,
                                    onIncrement: (() -> Void)? = nil,
                                    onDecrement: (() -> Void)? = nil) -> some View {
        modifier(RatingSummaryAccessibilityModifier(
            hint: hint,
            rating: rating,
            onIncrement: onIncrement,
            onDecrement: onDecrement
        ))
    }
}

