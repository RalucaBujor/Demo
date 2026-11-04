//
//  PaletteResolver.swift
//  DesignSystem
//
//  Created by Raluca Bujor on 22.06.2026.
//

import SwiftUI

public enum PaletteResolver {
    public static func palette(
        for brand: Brand,
        scheme: SwiftUI.ColorScheme
    ) -> DSColors {
        
        switch (brand, scheme) {
            
        case (.berry, .light):
            return DSColors(
                semantic: BerryLightSemantic.self,
                components: BerryLightComponents.self
            )
            
        case (.berry, .dark):
            return DSColors(
                semantic: BerryDarkSemantic.self,
                components: BerryDarkComponents.self
            )
            
        case (.olive, .light):
            return DSColors(
                semantic: OliveLightSemantic.self,
                components: OliveLightComponents.self
            )
            
        case (.olive, .dark):
            return DSColors(
                semantic: OliveDarkSemantic.self,
                components: OliveDarkComponents.self
            )
            
        case (.lime, .light):
            return DSColors(
                semantic: LimeLightSemantic.self,
                components: LimeLightComponents.self
            )
            
        case (.lime, .dark):
            return DSColors(
                semantic: LimeDarkSemantic.self,
                components: LimeDarkComponents.self
            )
            
        case (_, _):
            return DSColors(
                semantic: BerryLightSemantic.self,
                components: BerryLightComponents.self
            )
        }
    }
}
