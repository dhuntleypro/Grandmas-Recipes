//
//  Ingredient.swift
//  Grandmas Recipes
//
//  Created by Darrien Huntley on 3/6/21.
//

import SwiftUI
import Firebase

enum IngredientUnit {
    case cup, spoon, teaspoon, pinch, dash, Ib, kg, mg, g, mL, L
}


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

