//
//  ContentView.swift
//  HDrinkTracker
//
//  Created by Homayun on 1402-02-17.
//

import SwiftUI

struct AddDrinkView: View {
    @StateObject var viewModel = AddDrinkViewModel()
    
    var body: some View {
        VStack {
            TextField("Name", text: $viewModel.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            HStack {
                TextField("Calories", text: $viewModel.calories)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("Fat", text: $viewModel.fat)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("Milliliters", text: $viewModel.milliliters)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
            }
            
            Button(action: {
                guard let calories = Int(viewModel.calories),
                      let fat = Int(viewModel.fat),
                      let milliliters = Int(viewModel.milliliters) else {
                    return
                }
                viewModel.addDrink(name: viewModel.name, calories: calories, fat: fat, milliliters: milliliters)
                viewModel.clearFields()
            }) {
                Text("Add")
            }
            .padding()
            
            List(viewModel.drinks) { drink in
                VStack(alignment: .leading) {
                    Text(drink.name)
                        .font(.headline)
                    Text("Calories: \(drink.calories)")
                    Text("Fat: \(drink.fat)")
                    Text("Milliliters: \(drink.milliliters)")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AddDrinkView()
    }
}
