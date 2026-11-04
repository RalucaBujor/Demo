//
//  DemoAppTests.swift
//  DemoAppTests
//
//  Created by Raluca Bujor on 01.04.2026.
//

import XCTest
@testable import Berry

@MainActor
final class HomeViewModelTests: XCTestCase {

    private func makeViewModel(cardCount: Int = 5) -> HomeViewModel {
        let cards = (0..<cardCount).map { CardKnowledge(title: "Card \($0)", subtitle: "", body: "") }
        return HomeViewModel(topics: [], cards: cards)
    }

    // MARK: Learning battery

    func testBatteryStartsEmpty() {
        let viewModel = makeViewModel()

        XCTAssertEqual(viewModel.progress, 0)
        XCTAssertEqual(viewModel.percentage, 0)
    }

    func testBatteryIsShareOfAllPossibleStars() {
        let viewModel = makeViewModel(cardCount: 5)

        viewModel.presentAlert(for: 0)
        viewModel.setLovedIt()

        // 5 of 25 possible stars
        XCTAssertEqual(viewModel.percentage, 20)
    }

    func testBatteryIsEmptyWithoutCards() {
        let viewModel = makeViewModel(cardCount: 0)

        XCTAssertEqual(viewModel.progress, 0)
    }

    // MARK: Alert

    func testPresentAlertSelectsTheCard() {
        let viewModel = makeViewModel()

        viewModel.presentAlert(for: 2)

        XCTAssertTrue(viewModel.output.showAlert)
        XCTAssertEqual(viewModel.output.currentIndex, 2)
    }

    func testLovedItRatesFiveStarsAndDismisses() {
        let viewModel = makeViewModel()
        viewModel.presentAlert(for: 1)

        viewModel.setLovedIt()

        XCTAssertEqual(viewModel.output.ratings[1], 5)
        XCTAssertFalse(viewModel.output.showAlert)
    }

    // MARK: Rating

    func testIncrementStopsAtFive() {
        let viewModel = makeViewModel()
        viewModel.presentAlert(for: 0)

        (0..<7).forEach { _ in viewModel.incrementRating() }

        XCTAssertEqual(viewModel.output.ratings[0], 5)
    }

    func testDecrementStopsAtOne() {
        let viewModel = makeViewModel()
        viewModel.presentAlert(for: 0)
        viewModel.incrementRating()
        viewModel.incrementRating()

        (0..<5).forEach { _ in viewModel.decrementRating() }

        XCTAssertEqual(viewModel.output.ratings[0], 1)
    }

    func testDecrementKeepsAnUnratedLearningUnrated() {
        let viewModel = makeViewModel()
        viewModel.presentAlert(for: 0)

        viewModel.decrementRating()

        XCTAssertEqual(viewModel.output.ratings[0], 0)
    }

    func testRatingWithoutOpenAlertChangesNothing() {
        let viewModel = makeViewModel()

        viewModel.incrementRating()
        viewModel.setLovedIt()

        XCTAssertEqual(viewModel.output.ratings, [0, 0, 0, 0, 0])
    }
}
