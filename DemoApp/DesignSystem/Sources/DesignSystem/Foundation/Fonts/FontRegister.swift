//
//  FontRegister.swift
//  DesignSystem
//
//  Created by Raluca Bujor on 02.04.2026.
//

import Foundation
import CoreText

public enum FontRegister {
    public static func registerFonts() {
        registerFont(filename: "Roboto_Condensed-SemiBold.ttf")
        registerFont(filename: "Roboto_Condensed-Light.ttf")
        registerFont(filename: "Roboto_Condensed-Medium.ttf")
        registerFont(filename: "Roboto_Condensed-ExtraBold.ttf")
    }

    private static func registerFont(filename: String) {
        guard let url = Bundle.module.url(forResource: filename, withExtension: nil) else {
            assertionFailure("Font file not found: \(filename)")
            return
        }

        var error: Unmanaged<CFError>?
        CTFontManagerRegisterFontsForURL(url as CFURL, .process, &error)

        if let error = error?.takeRetainedValue() {
            assertionFailure("Failed to register font \(filename): \(error)")
        }
    }
}
