//
//  AlertInfoSectionBuilder.swift
//  DesignSystem
//
//  Created by Raluca Bujor on 02.04.2026.
//

import SwiftUI

@MainActor
@resultBuilder
public struct AlertInfoSectionBuilder {
    public static func buildBlock() -> EmptyView {
        EmptyView()
    }

    public static func buildBlock(
        _ disclaimer: Text
    ) -> some View {
        TokenStyledText(text: disclaimer)
    }
    
    public static func buildBlock<Content: View>(
        _ content: Content
    ) -> some View {
        content
    }
    
    public static func buildBlock(
        _ disclaimer: Text,
        _ timer: DSTimerView
    ) -> some View {
        VStack(
            alignment: .leading
        ) {
            TokenStyledText(text: disclaimer)
            timer
        }
    }
    
    public static func buildBlock<Content: View>(
        _ disclaimer: Text,
        _ timer: DSTimerView,
        _ other: Content
    ) -> some View {
        VStack(
            alignment: .leading
        ) {
            TokenStyledText(text: disclaimer)
            timer
            other
        }
    }
}
