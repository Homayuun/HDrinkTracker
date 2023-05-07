//
//  AddDrinkViewModel.swift
//  HDrinkTracker
//
//  Created by Homayun on 1402-02-17.
//

import Foundation

class AddDrinkViewModel {
    @Published var name: String = ""
    @Published var calories: String = ""
    @Published var fat: String = ""
    @Published var milliliters: String = ""
    @Published var drinks: [Drink] = []
    
    func addDrink(name: String, calories: Int, fat: Int, milliliters: Int) {
        if name.isEmpty || calories < 0 || fat < 0 || milliliters < 0 {
            return
        }
        let drink = Drink(name: name, calories: calories, fat: fat, milliliters: milliliters)
        drinks.append(drink)
    }
    
    func clearFields() {
        name = ""
        calories = ""
        fat = ""
        milliliters = ""
    }
    
}
