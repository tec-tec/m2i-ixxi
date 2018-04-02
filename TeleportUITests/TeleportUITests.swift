//
//  TeleportUITests.swift
//  TeleportUITests
//
//  Created by Ludovic Ollagnier on 30/03/2018.
//  Copyright © 2018 TecTec. All rights reserved.
//

import XCTest

class TeleportUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

        let app = XCUIApplication()
        let tabBarsQuery = app.tabBars
        tabBarsQuery.buttons["Carte"].tap()
        app.navigationBars["UIView"].buttons["Fake stop"].tap()

        let dTailsDeLArrTNavigationBar = app.navigationBars["Détails de l'arrêt"]
        dTailsDeLArrTNavigationBar.buttons["Back"].tap()
        tabBarsQuery.buttons["Réglages"].tap()
        app.buttons["Ajouter une ligne"].tap()
        app.navigationBars["Ligne"].buttons["Cancel"].tap()
        tabBarsQuery.buttons["Réseau"].tap()

        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.cells.staticTexts["Départ de Les Pins à Mérignac Centre"]/*[[".cells.staticTexts[\"Départ de Les Pins à Mérignac Centre\"]",".staticTexts[\"Départ de Les Pins à Mérignac Centre\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.cells.staticTexts["Frères Robinson"]/*[[".cells.staticTexts[\"Frères Robinson\"]",".staticTexts[\"Frères Robinson\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.tap()
        dTailsDeLArrTNavigationBar.buttons["Tram A"].tap()
        app.navigationBars["Tram A"].buttons["Lignes"].tap()

    }
    
}
