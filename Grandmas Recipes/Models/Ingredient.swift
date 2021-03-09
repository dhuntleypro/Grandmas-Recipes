//
//  Ingredient.swift
//  Grandmas Recipes
//
//  Created by Darrien Huntley on 3/6/21.
//

import SwiftUI
import Firebase

struct Ingredient: Identifiable {
 //  var id: String
    var id = UUID()

   var name: String
   var amount: Double
   var amountUnit : IngredientUnit
    
    var dictionary: [String: Any] {
        return [
            "id": id.uuidString,
            "name": name,
            "amount": amount,
            "amountUnit":amountUnit.rawValue
        ]
    }
    
}


//extension Array where Element == Ingredient {
//    func formatForFirebase() -> [[String:Any]]{
//        var returnVal:[[String:Any]] = []
//        for element in self {
//            returnVal.append(element.dictionary)
//        }
//
//        return returnVal
//    }
//
//}



enum IngredientUnit:String, CaseIterable {
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
    case L = "L"
    case whole = "whole"
}
