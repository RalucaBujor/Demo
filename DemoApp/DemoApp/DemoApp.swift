//
//  DemoApp.swift
//  DemoApp
//
//  Created by Raluca Bujor on 01.04.2026.
//

import SwiftUI
import DesignSystem

@main
struct DemoApp: App {
    
    init() {
        FontRegister.registerFonts()
    }
    
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}

struct RootView: View {
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        HomeView()
            .designSystem(
                brand: .current,
                scheme: colorScheme
            )
    }
}

extension Brand {
    static var current: Brand {
        let bundleId = Bundle.main.bundleIdentifier ?? ""
        
        if bundleId.hasSuffix(".berry") {
            return .berry
        } else if bundleId.hasSuffix(".olive") {
            return .olive
        } else if bundleId.hasSuffix(".lime") {
            return .lime
        } else {
            return .berry
        }
    }
}
