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
//    @Published var recipe = [RecipePost]()
//    @Published var ingredients = [Ingredient]()
//    @Published var steps = [Step]()
//
//    //var newItem_type : new_StepOrIngredient
//    @State var Ingredient_index = 0
//  //  @State var halfModal_textField1_val : String = "" // may need to be published
//  //  @State var halfModal_textField2_val : String = ""
//
//    @Published var halfModal_textField1_val  : String = ""
//    @Published var halfModal_textField2_val  : String = ""
//    @Published var ingredientUnit_index  = 0
//    @Published var halfModal_shown  = false
//
//
    
//    @State var halfModal_shown = false
    
    
    init() {
        fetchRecipes()
    }
    
    func fetchRecipes() {
        
    }
    

}
