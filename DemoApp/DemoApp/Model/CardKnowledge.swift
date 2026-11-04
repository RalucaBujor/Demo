//
//  CardKnowledge.swift
//  DemoApp
//
//  Created by Raluca Bujor on 20.08.2026.
//

import SwiftUI

struct CardKnowledge: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let body: String
}

extension CardKnowledge {
    static let data: [CardKnowledge] = [
        CardKnowledge(title: "Content injection",
                      subtitle: "Flexible and composable components",
                      body: "Give full control over what goes inside the component without inflating the initializer"),
        CardKnowledge(title: "Behaviors and styles",
                      subtitle: "Make the initializer clean",
                      body: "Expose borders, background through custom modifiers that keep your API clean and mirror how SwiftUI views behave"),
        CardKnowledge(title: "Result builders",
                      subtitle: "Add structured guidance",
                      body: "Add structure without sacrificing flexibility. Your complex foundation can make evolution elegant, not painful"),
        CardKnowledge(title: "Previews",
                      subtitle: "Use previews as living documentation for your screens and components",
                      body: "Use previews to get a view on the dynamic types and fix issues easily. They are a great way to test your views in a live environment"),
        CardKnowledge(title: "Sourcery",
                      subtitle: "Generate boilerplate code automatically",
                      body: "Use Sourcery to generate boilerplate code automatically for snapshot testing, ensuring your UI is always correct")
    ]
}
