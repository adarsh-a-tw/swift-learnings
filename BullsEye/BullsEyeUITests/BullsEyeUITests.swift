//
//  BullsEyeUITests.swift
//  BullsEyeUITests
//
//  Created by Adarsh A on 05/09/22.
//

import XCTest

class BullsEyeUITests: XCTestCase {

    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
       try super.tearDownWithError()
       app = nil
    }

    func testOneRound() throws {
        // UI tests must launch the application that they test.
        
        
        let app = XCUIApplication()
        app.launch()
        
        let app = XCUIApplication()
        let staticText = app.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .staticText).matching(identifier: "1").element(boundBy: 1)
        staticText.tap()
        staticText.tap()
        staticText.tap()
        staticText.tap()
        staticText.tap()
        app.staticTexts["Round:"].tap()
        app.windows["SBSwitcherWindow"].children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 1)/*@START_MENU_TOKEN@*/.press(forDuration: 0.5);/*[[".tap()",".press(forDuration: 0.5);"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        app/*@START_MENU_TOKEN@*/.otherElements["card:com.thevibegod.BullsEye:sceneID:com.thevibegod.BullsEye-default"]/*[[".windows[\"SBSwitcherWindow\"]",".otherElements[\"AppSwitcherContentView\"]",".otherElements[\"Bull's Eye\"]",".otherElements[\"card:com.thevibegod.BullsEye:sceneID:com.thevibegod.BullsEye-default\"]"],[[[-1,3],[-1,2],[-1,1,2],[-1,0,1]],[[-1,3],[-1,2],[-1,1,2]],[[-1,3],[-1,2]]],[0]]@END_MENU_TOKEN@*/.tap()

        
//        let hitMeStaticText = app/*@START_MENU_TOKEN@*/.staticTexts["Hit me!"]/*[[".buttons[\"Hit me!\"].staticTexts[\"Hit me!\"]",".staticTexts[\"Hit me!\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
//        hitMeStaticText.tap()
//
//        let okButton = app.alerts["Too far!"].scrollViews.otherElements.buttons["Ok"]
//        okButton.tap()
//        app.buttons["StartOverIcon"].tap()
//        app.staticTexts["Score:"].tap()
//        app.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.tap()
//        app.staticTexts["Round:"].tap()
//        hitMeStaticText.tap()
//        okButton.tap()
        
    }

}
