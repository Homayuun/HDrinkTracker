//
//  DrinkModel.swift
//  HDrinkTracker
//
//  Created by Homayun on 1402-02-17.
//

import Foundation

struct Drink: Identifiable {
    var id: String {
        self.name
    }
    let name: String
    let calories: Int
    let fat: Int
    let milliliters: Int
}
