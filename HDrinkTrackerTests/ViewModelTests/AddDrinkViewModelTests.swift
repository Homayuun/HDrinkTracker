//
//  AddDrinkViewModelTests.swift
//  HDrinkTrackerTests
//
//  Created by Homayun on 1402-02-17.
//

import Foundation
import XCTest
@testable import HDrinkTracker

class AddDrinkViewModelTests: XCTestCase {
    
    var viewModel: AddDrinkViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = AddDrinkViewModel()
    }
    
    func testAddDrink_AddsDrinkToDrinks() {
        let initialCount = viewModel.drinks.count
        viewModel.addDrink(name: "Coffee", calories: 50, fat: 1, milliliters: 240)
        XCTAssertEqual(viewModel.drinks.count, initialCount + 1)
        XCTAssertEqual(viewModel.drinks.last?.name, "Coffee")
        XCTAssertEqual(viewModel.drinks.last?.calories, 50)
        XCTAssertEqual(viewModel.drinks.last?.fat, 1)
        XCTAssertEqual(viewModel.drinks.last?.milliliters, 240)
    }
    
    func testAddDrink_WithInvalidName() {
        let initialCount = viewModel.drinks.count
        viewModel.addDrink(name: "", calories: 50, fat: 1, milliliters: 240)
        XCTAssertEqual(viewModel.drinks.count, initialCount)
    }
    
    func testAddDrink_WithInvalidCalories() {
        let initialCount = viewModel.drinks.count
        viewModel.addDrink(name: "Coffee", calories: -10, fat: 1, milliliters: 240)
        XCTAssertEqual(viewModel.drinks.count, initialCount)
    }
    
    func testAddDrink_WithNegativeFat() {
        let initialCount = viewModel.drinks.count
        viewModel.addDrink(name: "Coffee", calories: 50, fat: -1, milliliters: 240)
        XCTAssertEqual(viewModel.drinks.count, initialCount)
    }
    
    func testAddDrink_WithInvalidMilliliters() {
        let initialCount = viewModel.drinks.count
        viewModel.addDrink(name: "Coffee", calories: 50, fat: 1, milliliters: -240)
        XCTAssertEqual(viewModel.drinks.count, initialCount)
    }
    
    func testClearFields() {
        viewModel.name = "Coffee"
        viewModel.calories = "50"
        viewModel.fat = "1"
        viewModel.milliliters = "240"
        viewModel.clearFields()
        XCTAssertEqual(viewModel.name, "")
        XCTAssertEqual(viewModel.calories, "")
        XCTAssertEqual(viewModel.fat, "")
        XCTAssertEqual(viewModel.milliliters, "")
    }
}
