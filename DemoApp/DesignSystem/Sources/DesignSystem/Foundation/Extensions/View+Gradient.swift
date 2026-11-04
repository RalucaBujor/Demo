import SwiftUI

public struct GradientCardBackground: ViewModifier {
    // MARK: Public variables
    public var accent: Color
    public var cornerRadius: CGFloat?
    public var borderOpacity: CGFloat
    public var gradientTopOpacity: CGFloat
    public var gradientBottomOpacity: CGFloat
    public var shadowOpacity: CGFloat
    public var borderGradientColors: [Color]?
    
    // MARK: Private variables
    @Environment(\.designTokens) private var tokens
    
    public func body(content: Content) -> some View {
        let colors = borderGradientColors ?? [tokens.colors.semantic.gradientPrimaryFirst,
                                              tokens.colors.semantic.gradientPrimarySecond,
                                              tokens.colors.semantic.gradientPrimaryThird]
        content
            .background(
                ZStack(alignment: .topLeading) {
                    // Subtle action-tinted gradient for depth
                    LinearGradient(
                        colors: [
                            tokens.colors.semantic.gradientAccent.opacity(gradientTopOpacity),
                            tokens.colors.semantic.gradientAccent.opacity(gradientBottomOpacity)
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    // Optional soft radial highlight in the top-left for a premium feel
                    RadialGradient(
                        colors: [tokens.colors.semantic.gradientRadial.opacity(tokens.sizing.Gradient.radialOpacity), .clear],
                        center: .topLeading,
                        startRadius: tokens.sizing.Gradient.startRadius,
                        endRadius: tokens.sizing.Gradient.endRadius
                    )
                }
            )
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius ?? tokens.cornerRadius.lg)
                    .stroke(
                        AngularGradient(
                            gradient: Gradient(colors: colors.map { $0.opacity(borderOpacity) }),
                            center: .center
                        ),
                        lineWidth: tokens.sizing.Gradient.stroke
                    )
            )
            .cornerRadius(cornerRadius ?? tokens.cornerRadius.lg)
            .shadow(color: tokens.colors.semantic.gradientRadial.opacity(shadowOpacity),
                    radius:  tokens.sizing.Gradient.radius,
                    x: 0,
                    y: tokens.sizing.Gradient.shadowY)
    }
}

public extension View {
    @ViewBuilder
    func gradientCardBackground(
        accent: Color = .blue,
        cornerRadius: CGFloat? = nil,
        borderOpacity: CGFloat = 0.35,
        gradientTopOpacity: CGFloat = 0.22,
        gradientBottomOpacity: CGFloat = 0.10,
        shadowOpacity: CGFloat = 0.18,
        borderGradientColors: [Color]? = nil
    ) -> some View {
        modifier(GradientCardBackground(
            accent: accent,
            cornerRadius: cornerRadius,
            borderOpacity: borderOpacity,
            gradientTopOpacity: gradientTopOpacity,
            gradientBottomOpacity: gradientBottomOpacity,
            shadowOpacity: shadowOpacity,
            borderGradientColors: borderGradientColors
        ))
    }
}
