//
//  BottomModalView.swift
//  Grandmas Recipes
//
//  Created by Darrien Huntley on 3/7/21.
//
//
//import SwiftUI
//import SPAlert
//
//struct BottomModalView: View {
//    var steps : [Step]
//    
//    @StateObject var recipeVM = RecipeViewModel()
//    @Binding var halfModal_title : String
//    @Binding var halfModal_textField1_val : String
//    @Binding var halfModal_textField2_val : String
//
//    @Binding var halfModal_textField_placeholder : String
//    
//    @Binding var newItem_type : new_StepOrIngredient
//    @Binding var ingredientUnit_index : Int
//    
//    @Binding var halfModal_shown: Bool
//    @Binding var halfModal_height : CGFloat
//    
//    var body: some View {
//        VStack {
//            Spacer().frame(height: 15)
//            
//            Text("\(self.halfModal_title)")
//                .font(.headline)
//            VStack {
//            HStack{
//                if newItem_type == .Ingredient {
//                    TextField("#", text: self.$halfModal_textField1_val)
//                        .frame(width:40)
//                        .padding(10)
//                        .background(
//                            Rectangle()
//                                .cornerRadius(10)
//                                .foregroundColor(Color.init(red: 0.95, green: 0.95, blue: 0.95))
//                            
//                    )
//                        .padding(20)
//                        .keyboardType(.numberPad)
//                }
//                
//                
//                TextField("\(self.halfModal_textField_placeholder)", text: self.$halfModal_textField2_val)
//                    .padding(10)
//                    .background(
//                        Rectangle()
//                            .cornerRadius(10)
//                            .foregroundColor(Color.init(red: 0.95, green: 0.95, blue: 0.95))
//                        
//                )
//                    .padding(20)
//            }
//            }
//            if self.newItem_type == .Ingredient {
//                Picker(selection: self.$ingredientUnit_index, label: Text("Unit")){
//                    ForEach(0..<IngredientUnit.allCases.count){
//                        Text(IngredientUnit.allCases[$0].rawValue).tag($0)
//                    }
//                }
//                .labelsHidden()
//                .frame(height:90)
//                .clipped()
//                .padding()
//                
//            }
//            Button(action: {
//                    add_newItem()
//
//
//            }) {
//                Image(systemName: "plus.circle.fill")
//                    .font(.system(size: 35))
//                    .foregroundColor(.init(red: 110/255 , green: 210/255 , blue : 110/255))
//                
//            }
//            
//            Spacer()
//        }
//    }
//    func update_halfModal(title:String, placeholder:String, itemType:new_StepOrIngredient, height:CGFloat){
//           halfModal_textField1_val = ""
//           halfModal_textField2_val = ""
//           halfModal_title = title
//           halfModal_textField_placeholder = placeholder
//           newItem_type = itemType
//           halfModal_height = height
//   
//       }
//   
//       func possible_stringToDouble(_ stringToValidate:String) -> Double?{
//           let val:Double? = Double(stringToValidate) ?? nil
//   
//           if let val = val {
//               return val
//           } else {
//               return nil
//           }
//   
//       }
//       func hideModal(){
//   
//           UIApplication.shared.endEditing()
//           halfModal_shown = false
//       }
//   
//    mutating func add_newItem(){
//           if halfModal_textField2_val == "" {
//               let alertView = SPAlertView(title: newItem_type == .Step ? "Please add a step" : "Please add an Ingredient", message: "Make sure no textfields are left blank", preset: SPAlertPreset.error)
//               alertView.duration = 3
//               alertView.present()
//           } else {
//               if newItem_type == .Step {
//                   steps.append(Step(description: halfModal_textField2_val, orderNumber: steps.count))
//                   hideModal()
//               } else if newItem_type == .Ingredient{
//   
//                   if let amount = possible_stringToDouble(halfModal_textField1_val) {
//                       let thisIngredientUnit = IngredientUnit.allCases[ingredientUnit_index]
//   
//                       ingredients.append(Ingredient(name: halfModal_textField2_val,
//                                                     amount: amount,
//                                                     amountUnit: thisIngredientUnit,
//                                                     orderNumber: ingredients.count))
//                       hideModal()
//                   } else {
//                       let alertView = SPAlertView(title: "Check the amount", message: "Please enter a number (i.e. \"1\" or \"3.4\")", preset: SPAlertPreset.error)
//                       alertView.duration = 3
//                       alertView.present()
//                   }
//   
//               }
//           
//       }
//   }
//}
//
//struct BottomModalView_Previews: PreviewProvider {
//    static var previews: some View {
//        BottomModalView(halfModal_title: .constant("title"), halfModal_textField1_val: .constant("1"), halfModal_textField2_val: .constant("bacon"), halfModal_textField_placeholder: .constant("yoo"), newItem_type: .constant(.Step), ingredientUnit_index: .constant(0))
//    }
//}
