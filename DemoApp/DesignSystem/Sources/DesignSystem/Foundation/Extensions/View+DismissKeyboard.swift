//
//  View+DismissKeyboard.swift
//  DesignSystem
//
//  Created by Raluca Bujor on 06.04.2026.
//

import SwiftUI
#if canImport(UIKit)
import UIKit
#endif

extension View {
    public func hideKeyboardWhenTappedAround() -> some View  {
        return self.onTapGesture {
#if canImport(UIKit)
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                            to: nil, from: nil, for: nil)
#endif
        }
    }
}
