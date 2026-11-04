//
//  DesignTokens.swift
//  DesignSystem
//
//  Created by Raluca Bujor on 02.04.2026.
//

import SwiftUI

public struct DesignTokens: Sendable {
    public let brand: Brand
    public let scheme: ColorScheme
    public let colors: DSColors
    public let typography: DSTypography.Type = DSTypography.self
    public let spacing: DSSpacing.Type = DSSpacing.self
    public let sizing: DSSizing.Type = DSSizing.self
    public let icons: DSIcon.Type = DSIcon.self
    public let cornerRadius: DSCornerRadius.Type = DSCornerRadius.self
    
    public init(brand: Brand, scheme: ColorScheme) {
        self.brand = brand
        self.scheme = scheme
        self.colors = PaletteResolver.palette(for: brand, scheme: scheme)
    }
}

private struct DesignTokensKey: EnvironmentKey {
    static let defaultValue = DesignTokens(brand: .berry, scheme: .light)
}

public extension EnvironmentValues {
    var designTokens: DesignTokens {
        get { self[DesignTokensKey.self] }
        set { self[DesignTokensKey.self] = newValue }
    }
}

public extension View {
    func designSystem(brand: Brand, scheme: ColorScheme) -> some View {
        environment(\.designTokens, DesignTokens(brand: brand, scheme: scheme))
    }
}
