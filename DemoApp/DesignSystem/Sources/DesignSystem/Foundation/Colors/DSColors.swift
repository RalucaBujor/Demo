//
//  DSColors.swift
//  DesignSystem
//
//  Created by Raluca Bujor on 01.08.2026.
//

import SwiftUI

public struct DSColors: Sendable {
    public let semantic: DSSemanticColorPalette.Type

    internal init(
        semantic: DSSemanticColorPalette.Type,
        components: DSComponentColorPalette.Type
    ) {
        self.semantic = semantic
        self.components = components
    }

    internal let components: DSComponentColorPalette.Type
}
