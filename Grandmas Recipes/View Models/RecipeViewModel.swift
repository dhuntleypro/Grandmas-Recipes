//
//  RecipeViewModel.swift
//  Grandmas Recipes
//
//  Created by Darrien Huntley on 3/7/21.
//

import SwiftUI

enum new_StepOrIngredient{
    case Step, Ingredient
}

class RecipeViewModel: ObservableObject {
    @Published var recipe = [RecipePost]()
    @Published var ingredients = [Ingredient]()
    @Published var steps = [Step]()
    
    //var newItem_type : new_StepOrIngredient
    @State var Ingredient_index = 0
    @State var halfModal_textField_val : String = ""
    @State var halfModal_shown = false
    
    
    init() {
        fetchRecipes()
    }
    
    func fetchRecipes() {
        
    }
    
    func add_newStep(){
            //            steps.append(Step(description: halfModal_textField_val, orderNumber: steps.count))
            steps.append(Step(dictionary: [
                "description" : halfModal_textField_val,
                "orderNumber" : steps.count
            ]))
        
        UIApplication.shared.endEditing()
        halfModal_shown = false
    }
    
    func add_newIngredient(){
            //            steps.append(Step(description: halfModal_textField_val, orderNumber: steps.count))
        ingredients.append(Ingredient(dictionary: [
                "description" : halfModal_textField_val,
                "orderNumber" : steps.count
            ]))
        
        UIApplication.shared.endEditing()
        halfModal_shown = false
    }
}
