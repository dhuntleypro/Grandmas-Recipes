//
//  BottomModalView.swift
//  Grandmas Recipes
//
//  Created by Darrien Huntley on 3/7/21.
//

import SwiftUI

struct BottomModalView: View {
    @StateObject var recipeVM = RecipeViewModel()
    @Binding var halfModal_title : String
    @Binding var halfModal_textField_val : String
    @Binding var halfModal_textField_placeholder : String
    
    @Binding var newItem_type : new_StepOrIngredient
    @Binding var ingredientUnit_index : Int

    
    var body: some View {
        VStack {
            Spacer().frame(height: 15)
            
            Text("\(self.halfModal_title)")
                .font(.headline)
            HStack{
                if newItem_type == .Ingredient {
                    TextField("#", text: self.$halfModal_textField_val)
                        .frame(width:40)
                        .padding(10)
                        .background(
                            Rectangle()
                                .cornerRadius(10)
                                .foregroundColor(Color.init(red: 0.95, green: 0.95, blue: 0.95))
                            
                    )
                        .padding(20)
                        .keyboardType(.numberPad)
                }
                
                
                TextField("\(self.halfModal_textField_placeholder)", text: self.$halfModal_textField_val)
                    .padding(10)
                    .background(
                        Rectangle()
                            .cornerRadius(10)
                            .foregroundColor(Color.init(red: 0.95, green: 0.95, blue: 0.95))
                        
                )
                    .padding(20)
            }
            if self.newItem_type == .Ingredient {
                Picker(selection: self.$ingredientUnit_index, label: Text("Unit")){
//                    ForEach(0..<IngredientUnit.allCases.count){
//                        Text(IngredientUnit.allCases[$0].rawValue).tag($0)
//                    }
                }
                .frame(height:90)
                .clipped()
                .padding()
                
            }
            Button(action: {
                if newItem_type == .Step {
                    recipeVM.add_newStep()

                } else  if newItem_type == .Ingredient {
                    recipeVM.add_newIngredient()
                    
                }

            }) {
                Image(systemName: "plus.circle.fill")
                    .font(.system(size: 35))
                    .foregroundColor(.init(red: 110/255 , green: 210/255 , blue : 110/255))
                
            }
            
            Spacer()
        }
    }
}

struct BottomModalView_Previews: PreviewProvider {
    static var previews: some View {
        BottomModalView(halfModal_title: .constant(""), halfModal_textField_val: .constant(""), halfModal_textField_placeholder: .constant(""), newItem_type: .constant(.Step), ingredientUnit_index: .constant(0))
    }
}
