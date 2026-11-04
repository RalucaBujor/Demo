//
//  HomeViewModel.swift
//  DemoApp
//
//  Created by Raluca Bujor on 19.08.2026.
//

import SwiftUI
import Combine

final class HomeViewModel: ObservableObject {
    // MARK: Variables
    @Published var output: Output
    
    struct Output {
        var topics: [Topic]
        var cards: [CardKnowledge]
        var ratings: [Int]
        var showAlert: Bool = false
        var currentIndex: Int?
    }
    
    // MARK: Init
    init(topics: [Topic] = Topic.data, cards: [CardKnowledge] = CardKnowledge.data) {
        self.output = .init(topics: topics,
                            cards: cards,
                            ratings: Array(repeating: 0, count: cards.count))
    }
    
    var progress: Double {
        totalPossible > 0 ? Double(totalLearned) / totalPossible : 0
    }

    var percentage: Int {
        Int(progress * 100)
    }

    func presentAlert(for index: Int) {
        output.currentIndex = index
        output.showAlert = true
    }

    func dismissAlert() {
        output.showAlert = false
    }

    func incrementRating() {
        guard let currentIndex = output.currentIndex else { return }
        output.ratings[currentIndex] = min(output.ratings[currentIndex] + 1, 5)
    }

    func decrementRating() {
        guard let currentIndex = output.currentIndex,
              output.ratings[currentIndex] > 1 else { return }
        output.ratings[currentIndex] -= 1
    }

    func setLovedIt() {
        guard let currentIndex = output.currentIndex else { return }
        output.ratings[currentIndex] = 5
        output.showAlert = false
    }
    
    // MARK: Helpers
    private var totalPossible: Double {
        Double(output.cards.count * 5)
    }

    private var totalLearned: Int {
        output.ratings.reduce(0, +)
    }

}
