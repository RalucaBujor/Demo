//
//  DemoAppUITests.swift
//  DemoAppUITests
//
//  Created by Raluca Bujor on 01.04.2026.
//

import XCTest

final class DemoAppUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    /// The main flow of the demo: open a card's alert, rate it with "I loved it",
    /// and see the learning battery go up. Elements are found by their accessibility
    /// labels - the same ones VoiceOver and Voice Control use.
    @MainActor
    func testLovingALearningChargesTheBattery() throws {
        let app = XCUIApplication()
        app.launch()

        XCTAssertTrue(app.staticTexts["Your learning battery: 0%"].waitForExistence(timeout: 5))

        app.buttons["See more"].firstMatch.tap()
        let lovedIt = app.buttons["I loved it"]
        XCTAssertTrue(lovedIt.waitForExistence(timeout: 2))

        lovedIt.tap()

        XCTAssertTrue(app.staticTexts["Your learning battery: 20%"].waitForExistence(timeout: 2))
        XCTAssertFalse(lovedIt.exists)
    }

    @MainActor
    func testDismissLeavesTheBatteryUnchanged() throws {
        let app = XCUIApplication()
        app.launch()

        app.buttons["See more"].firstMatch.tap()
        let dismiss = app.buttons["Dismiss alert"]
        XCTAssertTrue(dismiss.waitForExistence(timeout: 2))

        dismiss.tap()

        XCTAssertTrue(app.staticTexts["Your learning battery: 0%"].waitForExistence(timeout: 2))
    }
}
