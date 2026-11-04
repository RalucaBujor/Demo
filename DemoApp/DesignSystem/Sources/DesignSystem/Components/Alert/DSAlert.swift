//
//  DSAlert.swift
//  DesignSystem
//
//  Created by Raluca Bujor on 02.04.2026.
//

import SwiftUI

public struct DSAlert<Footer: View, InfoSection: View>: View {
    // MARK: Private constants
    private let title: String
    private let message: String
    private let type: AlertType
    private let infoSection: InfoSection
    private let footer: Footer
    
    // MARK: Public variables
    @Environment(\.designTokens) var tokens
    
    // MARK: Init
    public init(title: String,
                message: String,
                alertType: AlertType,
                @AlertInfoSectionBuilder infoSection: () -> InfoSection,
                @ViewBuilder footer: @escaping () -> Footer) {
        self.title = title
        self.message = message
        self.type = alertType
        self.infoSection = infoSection()
        self.footer = footer()
    }
}

extension DSAlert {
    public var body: some View {
        VStack(
            alignment: .leading,
            spacing: tokens.spacing.xs
        ) {
            VStack(
                alignment: .leading
            ) {
                headingView
                
                Text(message)
                    .font(.subheadline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundStyle(tokens.colors.semantic.textPrimary)
                
                infoSection
                    .padding(.top, tokens.spacing.sm)
            }
            .frame(maxWidth: .infinity)
            
            footer
                .accessibilitySortPriority(0)
                .padding(.top, tokens.spacing.md)
        }
        .padding()
        .background(tokens.colors.components.alertDefaultBackground)
        .gradientCardBackground()
        .padding(.horizontal, tokens.spacing.md)
        .accessibilityAddTraits(.isModal)
    }
    
    var headingView: some View {
        HStack {
            type.icon(with: tokens)
                .accessibilityLabel(type.iconAccessibilityLabel)
                .foregroundStyle(type.tintColor(with: tokens))
            
            Text(title)
                .font(tokens.typography.body)
                .foregroundStyle(tokens.colors.semantic.textPrimary)
                .accessibilityAddTraits(.isHeader)
        }
    }
}

// MARK: - Previews
private struct DSAlertPreviewContent: View {
    @Environment(\.designTokens) private var tokens
    
    var body: some View {
        ScrollView {
            Text("Simple Alert")
                .font(tokens.typography.bodyBold)
                .foregroundColor(tokens.colors.semantic.textPrimary)
            
            DSAlert(
                title: "Design System Update",
                message: "A new version of the design system is available. Review the latest components and improvements.",
                alertType: .info,
                infoSection: { },
                footer: {
                    DSButton(type: .primary, title: "Review update") { }
                }
            )
            
            Text("With Info Section (DSTimerView)")
                .font(tokens.typography.bodyBold)
                .foregroundColor(tokens.colors.semantic.textPrimary)
            
            DSAlert(
                title: "Session Expired",
                message: "Your session has expired due to inactivity.",
                alertType: .error,
                infoSection: {
                    DSTimerView(targetDate: Date().addingTimeInterval(200))
                },
                footer: {
                    DSButton(type: .secondary, title: "Cancel") { }
                        .destructive()
                }
            )
            
            Text("With Info Section (Disclaimer)")
                .font(tokens.typography.bodyBold)
                .foregroundColor(tokens.colors.semantic.textPrimary)
            
            DSAlert(
                title: "Action Required",
                message: "This action may affect your current configuration and cannot be undone.",
                alertType: .warning,
                infoSection: {
                    Text("Please review the changes carefully before proceeding. Once confirmed, your previous settings may no longer be available.")
                        .font(tokens.typography.headline)
                        .foregroundColor(tokens.colors.semantic.textInverse)
                },
                footer: {
                    DSButton(type: .primary, title: "Continue") { }
                }
            )
            
            Text("With Info Section (Disclaimer & DSTimerView)")
                .font(tokens.typography.bodyBold)
                .foregroundColor(tokens.colors.semantic.textPrimary)
            
            DSAlert(
                title: "Review Before Continuing",
                message: "Some changes may impact the current experience.",
                alertType: .info,
                infoSection: {
                    Text("By continuing, you acknowledge that these changes may affect existing settings and configurations.")
                        .font(tokens.typography.bodyBold)
                        .foregroundColor(tokens.colors.semantic.textInverse)
                    
                    DSTimerView(targetDate: .now + 100)
                },
                footer: {
                    DSButton(type: .primary, title: "Continue") { }
                }
            )
        }
        .padding()
    }
}

struct DSAlert_LightMode_Previews: PreviewProvider {
    static var previews: some View {
        DSAlertPreviewContent()
            .designSystem(
                brand: .berry,
                scheme: .light
            )
    }
}

struct DSAlert_DarkMode_Previews: PreviewProvider {
    static var previews: some View {
        DSAlertPreviewContent()
            .designSystem(
                brand: .olive,
                scheme: .dark
            )
            .background(.black)
    }
}

struct DSAlert_DynamicMode_Previews: PreviewProvider {
    static var previews: some View {
        DSAlertPreviewContent()
            .environment(\.sizeCategory, .accessibilityExtraExtraLarge)
            .environment(\.layoutDirection, .leftToRight)
    }
}

struct DSAlert_Dynamic5Mode_Previews: PreviewProvider {
    static var previews: some View {
        DSAlertPreviewContent()
            .dynamicTypeSize(.accessibility5)
            .environment(\.layoutDirection, .leftToRight)
    }
}
