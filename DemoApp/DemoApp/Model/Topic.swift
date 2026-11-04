//
//  Topic.swift
//  DemoApp
//
//  Created by Raluca Bujor on 20.08.2026.
//

import SwiftUI

struct Topic: Identifiable {
    let id = UUID()
    let title: String
    let image: Image
}

extension Topic {
    static let data: [Topic] = [
        Topic(title: "Accessibility",
              image: Image(systemName: "accessibility")),
        Topic(title: "Previews",
              image: Image(systemName: "inset.filled.rectangle.and.person.filled.circle")),
        Topic(title: "Sourcery",
              image: Image(systemName: "swiftdata"))]
}
