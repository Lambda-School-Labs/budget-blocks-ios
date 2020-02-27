//
//  Budget_BlocksUITests.swift
//  Budget BlocksUITests
//
//  Created by Isaac Lyons on 1/24/20.
//  Copyright © 2020 Isaac Lyons. All rights reserved.
//

import XCTest
@testable import Budget_Blocks

class Budget_BlocksUITests: XCTestCase {
    
    private var app: XCUIApplication = { XCUIApplication() }()

    override func setUp() {
        continueAfterFailure = false

        app.launch()
        
        let signOutButton = app.buttons["Sign out"]
        if signOutButton.exists {
            signOutButton.tap()
        }
    }

    override func tearDown() {
    }

    func testLogin() {
        login()
        sleep(5)
        
        app.staticTexts["Dashboard"].tap()
    }
    
    private func login() {
        
        app.buttons["Sign In"].tap()
        
        app.textFields.firstMatch.tap()
        app.typeText("email@example.com")
        app.keyboards.buttons["Return"].tap()
        
        app.typeText("password")
        app.keyboards.buttons["Return"].tap()
        
        app.buttons.matching(identifier: "Sign In").element(boundBy: 1).tap()
    }
    
}
