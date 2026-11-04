//
//  HomeView.swift
//  DemoApp
//
//  Created by Raluca Bujor on 02.04.2026.
//

import SwiftUI
import DesignSystem

struct HomeView: View {
    @StateObject private var viewModel: HomeViewModel
    @Environment(\.designTokens) private var tokens

    // MARK: Init
    init(viewModel: HomeViewModel = HomeViewModel()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    // MARK: Body
    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: tokens.spacing.lg) {
                    learnings
                    
                    HStack {
                        ForEach(viewModel.output.topics) { topic in
                            DSTag(image: topic.image,
                                  text: topic.title)
                            .aspectRatio(contentMode: .fill)
                        }
                    }
                    
                    ForEach(viewModel.output.cards.enumerated(), id: \.offset) { index, card in
                        DSCard(card: .init(image: tokens.icons.swift,
                                           title: card.title,
                                           subtitle: card.subtitle,
                                           body: card.body,
                                           button: "See more",
                                           action: {
                            viewModel.presentAlert(for: index)
                        }))
                    }
                }
                .padding(tokens.spacing.lg)
            }
            .background(tokens.colors.semantic.surfacePrimary)
            .scrollIndicators(.hidden)
            .hideKeyboardWhenTappedAround()
            
            alert
        }
        .ignoresSafeArea(edges: [.bottom, .horizontal])
    }
}

private extension HomeView {
    @ViewBuilder
    var learnings: some View {
        VStack(alignment: .leading, spacing: tokens.spacing.sm) {
            let percentage = viewModel.percentage
            let progress = viewModel.progress
            
            Text("🔋 Your learning battery: \(percentage)%")
                .font(tokens.typography.headlineHeavy)
                .foregroundStyle(tokens.colors.semantic.textPrimary)
                .accessibilityLabel("Your learning battery: \(percentage)%")
            
            ProgressView(value: progress)
                .tint(tokens.colors.semantic.accentSecondary)
                .accessibilityLabel("Learning battery")
        }
    }
    
    @ViewBuilder
    var alert: some View {
        if viewModel.output.showAlert,
            let currentIndex = viewModel.output.currentIndex {
            DSAlert(
                title: "How much did you learn?",
                message: "Use the stars or the buttons to rate how this learning was.",
                alertType: .success,
                infoSection: {
//                    Text("This will influence the total learnings from today and you have 2 minutes to give an answer. Please rate carefully.")
//                        .font(tokens.typography.captionBold)
//                        .foregroundStyle(tokens.colors.semantic.textInverse)
                    
//                    DSTimerView(targetDate: .now + 120)
//                    
                    DSRatingView(rating: $viewModel.output.ratings[currentIndex])
                        .ratingAccessibility(
                            hint: "Swipe up to increase or swipe down to decrease your rating.",
                            rating: $viewModel.output.ratings[currentIndex],
                            onIncrement: {
                                viewModel.incrementRating()
                            },
                            onDecrement: {
                                viewModel.decrementRating()
                            }
                        )
                },
                footer: {
                    HStack {
                        DSButton(type: .secondary, title: "Dismiss") {
                            viewModel.dismissAlert()
                        }
                        .destructive()
                        .accessibilityLabel("Dismiss alert")
                        
                        DSButton(
                            type: .primary,
                            title: "I loved it"
                        ) {
                            viewModel.setLovedIt()
                        }
                        .accessibilityLabel("I loved it")
                        .accessibilityHint("Rates this learning with 5 stars and dismisses alert")
                    }
                }
            )
        }
    }
}

struct Home_BerryLightMode_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .designSystem(
                brand: .berry,
                scheme: .light
            )
            .preferredColorScheme(.light)
            .environment(\.sizeCategory, .large)
    }
}

struct Home_BerryDarkMode_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .designSystem(
                brand: .berry,
                scheme: .dark
            )
            .environment(\.sizeCategory, .large)
    }
}

struct Home_OliveLightMode_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .designSystem(
                brand: .olive,
                scheme: .light
            )
            .preferredColorScheme(.light)
            .environment(\.sizeCategory, .large)
    }
}

struct Home_OliveDarkMode_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .designSystem(
                brand: .olive,
                scheme: .dark
            )
            .environment(\.sizeCategory, .large)
    }
}

struct Home_LimeLightMode_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .designSystem(
                brand: .lime,
                scheme: .light
            )
            .environment(\.sizeCategory, .large)
    }
}

struct Home_LimeDarkMode_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .designSystem(
                brand: .lime,
                scheme: .dark
            )
            .environment(\.sizeCategory, .large)
    }
}

struct Home_LightA11yLargeText_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environment(\.sizeCategory, .accessibilityExtraExtraLarge)
    }
}

struct Home_DarkA11yLargestBoldText_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .designSystem(
                brand: .current,
                scheme: .dark
            )
            .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
            .environment(\.legibilityWeight, .bold)
    }
}

struct Home_RightToLeftA11y_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .designSystem(
                brand: .current,
                scheme: .dark
            )
            .environment(\.sizeCategory, .accessibilityExtraExtraLarge)
            .environment(\.layoutDirection, .rightToLeft)
    }
}

