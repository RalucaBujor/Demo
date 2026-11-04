//
//  DSTimerView.swift
//  DesignSystem
//
//  Created by Raluca Bujor on 02.04.2026.
//

import SwiftUI
import Combine

public struct DSTimerView: View {
    // MARK: Private constants
    private let targetDate: Date
    private let timer = Timer.publish(every: 1,
                                      on: .main,
                                      in: .common).autoconnect()
    
    // MARK: Private variables
    @State private var remainingSeconds: Int
    @Environment(\.designTokens) private var tokens
    
    // MARK: Init
    public init(targetDate: Date) {
        self.targetDate = targetDate
        let initialSeconds = max(Int(targetDate.timeIntervalSinceNow), 0)
        self._remainingSeconds = State(initialValue: initialSeconds)
    }
    
    // MARK: Body
    public var body: some View {
        Text(timeString)
            .padding()
            .frame(maxWidth: .infinity)
            .font(tokens.typography.headlineHeavy)
            .foregroundStyle(tokens.colors.semantic.textPrimary)
            .background(tokens.colors.semantic.surfaceSecondary)
            .cornerRadius(tokens.cornerRadius.sm)
            .onReceive(timer) { _ in
                let seconds = max(Int(targetDate.timeIntervalSinceNow), 0)
                if remainingSeconds != seconds {
                    remainingSeconds = seconds
                }
            }
    }
    
    private var timeString: String {
        let minutes = remainingSeconds / 60
        let seconds = remainingSeconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}


private struct DSTimerPreviewContent: View {
    var body: some View {
        VStack(spacing: 16) {
            DSTimerView(targetDate: Date().addingTimeInterval(20))
        }
        .padding()
    }
}

struct DSTimer_LightMode_Previews: PreviewProvider {
    static var previews: some View {
        DSTimerPreviewContent()
    }
}

struct DSTimer_DarkMode_Previews: PreviewProvider {
    static var previews: some View {
        DSTimerPreviewContent()
            .designSystem(brand: .berry,
                          scheme: .dark)
            .background(.black)
    }
}

struct DSTimer_DynamicMode_Previews: PreviewProvider {
    static var previews: some View {
        DSTimerPreviewContent()
            .designSystem(brand: .berry,
                          scheme: .light)
            .environment(\.sizeCategory, .accessibilityExtraExtraLarge)
            .environment(\.layoutDirection, .leftToRight)
    }
}
