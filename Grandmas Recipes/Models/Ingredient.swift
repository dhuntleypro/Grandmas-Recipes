//
//  Ingredient.swift
//  Grandmas Recipes
//
//  Created by Darrien Huntley on 3/6/21.
//

import SwiftUI
import Firebase





struct Ingredient: Identifiable {
   var id: String
   var name: String
   var amount: Double
   var amountUnit : IngredientUnit
   var orderNumber: Int
    
    init(dictionary : [String: Any]) {
        self.id = dictionary["uid"] as? String ?? ""
        self.name = dictionary["name"] as? String ?? ""
        self.amount = dictionary["amount"] as? Double ?? 0.0
        self.amountUnit = dictionary["amountUnit"] as! IngredientUnit 
        self.orderNumber = dictionary["orderNumber"] as? Int ?? 0

    }
}



enum IngredientUnit: String {
    // value = Display name
    case cup = "cup"
    case tablespoon = "tablespoon"
    case teaspoon = "teaspoon"
    case pinch = "pinch"
    case dash = "dash"
    case lb = "lb"
    case kg = "kg"
    case mg = "mg"
    case g = "g"
    case mL = "mL"
    case L = "Liter"
    case whole = "whole"
}
