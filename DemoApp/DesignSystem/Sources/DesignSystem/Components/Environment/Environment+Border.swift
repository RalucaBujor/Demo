//
//  Environment+Border.swift
//  DesignSystem
//
//  Created by Raluca Bujor on 02.04.2026.
//

import SwiftUI

/// An environment value that controls whether a border is shown around certain components.
extension EnvironmentValues {
    @Entry var showBorder: Bool = false
}

extension View {
    /// Sets whether a border should be shown around the view or its children.
    /// - Parameter show: Pass `true` to show a border, or `false` to hide it.
    /// - Returns: A view that reflects the border visibility setting.
    public func showBorder(_ show: Bool) -> some View {
        environment(\.showBorder, show)
    }
}
