//
//  NewPostView.swift
//  Grandmas Recipes
//
//  Created by Darrien Huntley on 3/6/21.
//

import SwiftUI
import SPAlert
import Firebase

struct NewPostView: View {
    @ObservedObject var recipeVM = RecipeViewModel()

    @ObservedObject var stepVM = StepViewModel()
    @ObservedObject var ingredientVM = IngredientViewModel()
    
    @State var showSheet = false
    @State var showImagePicker = false
    @State var sourceType:UIImagePickerController.SourceType = .camera
    @State private var image:UIImage?
    
    @State var halfModal_shown = false
    
    @State var halfModal_title = ""
    @State var halfModal_textField_placeholder = ""
    @State var halfModal_textField1_val = ""
    @State var halfModal_textField2_val = ""
    @State var halfModal_height:CGFloat = 380
    
    @State var newItem_type : new_StepOrIngredient = .Step
    @State var ingredientUnit_index = 0
    
    //Sample Data
    @State var steps:[Step] = [
        //        Step(description: "add eggs", orderNumber: 0),
        //        Step(description: "add eggs", orderNumber: 1),
        //        Step(description: "add eggs", orderNumber: 2),
        //        Step(description: "add eggs", orderNumber: 3),
        //        Step(description: "add eggs", orderNumber: 4),
        //        Step(description: "add eggs", orderNumber: 5),
        //        Step(description: "add eggs", orderNumber: 6),
        //        Step(description: "add eggs", orderNumber: 7)
    ]
    @State var ingredients:[Ingredient] = [
        //        Ingredient(name: "eggs", amount: 3, amountUnit: .whole, orderNumber: 0),
        //        Ingredient(name: "parsley", amount: 2, amountUnit: .whole, orderNumber: 1),
        //        Ingredient(name: "eggs", amount: 3, amountUnit: .whole, orderNumber: 2),
        //        Ingredient(name: "parsley", amount: 2, amountUnit: .whole, orderNumber: 3),
        //        Ingredient(name: "eggs", amount: 3, amountUnit: .whole, orderNumber: 4),
        //        Ingredient(name: "parsley", amount: 2, amountUnit: .whole, orderNumber: 5),
        //        Ingredient(name: "eggs", amount: 3, amountUnit: .whole, orderNumber: 6),
        //        Ingredient(name: "parsley", amount: 2, amountUnit: .whole, orderNumber: 7),
        //        Ingredient(name: "eggs", amount: 3, amountUnit: .whole, orderNumber: 8),
        //        Ingredient(name: "parsley", amount: 2, amountUnit: .whole, orderNumber: 9),
        //        Ingredient(name: "eggs", amount: 3, amountUnit: .whole, orderNumber: 10),
        //        Ingredient(name: "parsley", amount: 2, amountUnit: .whole, orderNumber: 11),
        //        Ingredient(name: "eggs", amount: 3, amountUnit: .whole, orderNumber: 12),
        //        Ingredient(name: "parsley", amount: 2, amountUnit: .whole, orderNumber: 13),
        //        Ingredient(name: "eggs", amount: 3, amountUnit: .whole, orderNumber: 14),
        //        Ingredient(name: "parsley", amount: 2, amountUnit: .whole, orderNumber: 15),
        //        Ingredient(name: "eggs", amount: 3, amountUnit: .whole, orderNumber: 10),
        //        Ingredient(name: "parsley", amount: 2, amountUnit: .whole, orderNumber: 11),
        //        Ingredient(name: "eggs", amount: 3, amountUnit: .whole, orderNumber: 12),
        //        Ingredient(name: "parsley", amount: 2, amountUnit: .whole, orderNumber: 13),
        //        Ingredient(name: "eggs", amount: 3, amountUnit: .whole, orderNumber: 14),
        //        Ingredient(name: "parsley", amount: 2, amountUnit: .whole, orderNumber: 15)
    ]
    var body: some View {
        
        ZStack {
            VStack(spacing: 0) {
                Spacer().frame(height: 65) //(fix) -- hard coded need to fit all apps
                ZStack(alignment: .topTrailing) {
                    HStack {
                        
                        if image != nil {
                            Image(uiImage: image!)
                                .resizable()
                                .scaledToFit()
                                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
                                .background(Color.black)
                        } else {
                            Image(systemName: "camera")
                                .resizable()
                                .scaledToFit()
                                .padding(130)
                                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
                                .background(Color.init(red: 1, green: 1, blue: 1))
                        }
                        
                    }
                    Button(action: {
                        self.showSheet.toggle()
                    }) {
                        
                        ZStack {
                            Image(systemName: "plus.circle")
                                .foregroundColor(.black)
                            
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.white)
                            
                        }
                        //   .padding()
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                        .shadow(radius: 4)
                        .opacity(0.7)
                        .padding()
                        
                    }.actionSheet(isPresented: $showSheet, content: {
                        ActionSheet(title: Text("Add a picture to your post"), message: nil, buttons: [
                            .default(Text("Camera"), action: {
                                showImagePicker = true
                                sourceType = .camera
                            }),
                            .default(Text("Photo Library"), action: {
                                showImagePicker = true
                                sourceType = .photoLibrary
                            }),
                            .cancel()
                            
                        ])
                    })
                    
                }
                HStack {
                    
                    ZStack(alignment: .topTrailing) {
                        VStack {
                            Text("Ingredients")
                                .padding(.top)
                            
                            
                            ScrollView{
                                VStack(spacing: 0){
                                    if ingredients.count > 0 {
                                        
                                        ForEach(ingredients, id: \.id) { ingredient in
                                            HStack {
                                                Text("\(ingredient.amount.stringWithoutZeroFraction)  \(ingredient.amountUnit.rawValue) of \(ingredient.name) ")
                                                    .padding(.bottom, 3)
                                                
                                                Spacer()
                                            }
                                            .foregroundColor(.init(red: 108/255, green: 204/255, blue: 108/255))
                                        }
                                    }else {
                                        Button(action: {
                                            self.update_halfModal(title: "ADD AN INGREDIENT", placeholder: "Enter new ingredient", itemType: .Ingredient, height: 470)
                                            self.halfModal_shown = true
                                        }) {
                                            Text("Add some ingredients")
                                                .padding()
                                                .foregroundColor(.gray)
                                        }
                                        .foregroundColor(Color.init(red: 108/255, green: 204/255, blue: 108/255))
                                        
                                        
                                    }
                                    
                                }
                                .padding()
                            }
                            .frame(width: UIScreen.main.bounds.width/2)
                            .clipped()
                        }
                        .background(Color.clear)
                        
                        
                        Button(action: {
                            self.update_halfModal(title: "ADD AN INGREDIENT", placeholder: "Enter new ingredient", itemType: .Ingredient, height: 470)
                            self.halfModal_shown = true
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .padding()
                                .font(.system(size: 20))
                                .foregroundColor(.black)
                                .opacity(0.7)
                        }
                    }
                    
                    Divider()
                    
                    ZStack(alignment: .topTrailing) {
                        VStack {
                            Text("Steps")
                                .padding(.top)
                            ScrollView{
                                VStack(spacing: 0){
                                    if steps.count > 0 {
                                        
                                        ForEach(steps, id: \.id) {step in
                                            HStack {
                                                Text("\(step.orderNumber + 1). " + step.description)

                                                Spacer()
                                            }
                                        }
                                    } else {
                                        Button(action: {
                                            self.update_halfModal(title: "ADD A STEP", placeholder: "Enter new step", itemType: .Step, height: 380)
                                            self.halfModal_shown = true
                                        }) {
                                            Text("Add some steps")
                                                .padding()
                                                .foregroundColor(.gray)
                                        }
                                    }
                                    
                                }
                                .padding()
                            }
                            .frame(width: UIScreen.main.bounds.width/2)
                            .clipped()
                            
                            //                            Text("Add New")
                            //                                .padding()
                        }
                        .background(Color.clear)
                        
                        Button(action: {
                            self.update_halfModal(title: "ADD A STEP", placeholder: "Enter new step", itemType: .Step, height: 380)
                            
                            self.halfModal_shown.toggle()
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .padding()
                                .font(.system(size: 20))
                                .foregroundColor(.black)
                                .opacity(0.7)
                        }
                    }
                    
                }.background(Color.init(red : 0.95 , green: 0.95 , blue: 0.95))
                
                // SUBIT BUTTON
                    Button(action: {
                        if let thisImage = self.image {
                            let thisRecipePost = RecipePost(steps: self.steps,
                                                            ingredients: self.ingredients,
                                                          //  postingUser: self.env.currentUser.establishedID,
                                                            postingUser: Auth.auth().currentUser?.uid ?? "[ missing uid ]",
                                                            description: "",
                                                            numberOfLikes: 0,
                                                            image: Image(uiImage: thisImage)

                            )

                            print(thisRecipePost.dictionary)

                            firestoreSubmit_data(docRef_string: "recipe/\(thisRecipePost.id)", dataToSave: thisRecipePost.dictionary, completion: {_ in })
                        } else {
                            let alertView = SPAlertView(title: "Add a photo", message: "You cannot submit a recipe without a photo", preset:  SPAlertIconPreset.error)
                          //  alertView.duration = 3
                            alertView.present()
                        }
                    }) {
                        Text("SUBMIT RECIPE")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: UIScreen.main.bounds.width)
                            .padding(20)
                            .background(Color.black)
                    }
                
                
                Spacer().frame(height: 65)
            }
            .sheet(isPresented: $showImagePicker) {
                CustomImagePickerWindow(image: $image, sourceType: $sourceType)
                // MultipleImagePicker(image: $image , sourceType : sourceType)
            }
            
            // half sheet
            HalfModalView(isShown: $halfModal_shown, modalHeight: halfModal_height) {
                
                VStack{
                    Spacer().frame(height:15)
                    Text("\(self.halfModal_title)").font(.headline)
                    VStack{
                        HStack{
                            if self.newItem_type == .Ingredient {
                                TextField("#", text: self.$halfModal_textField1_val)
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
                            
                            // step + ingredient
                            TextField("\(self.halfModal_textField_placeholder)", text: self.$halfModal_textField2_val)
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
                                ForEach(0..<IngredientUnit.allCases.count){
                                    Text(IngredientUnit.allCases[$0].rawValue).tag($0)
                                }
                            }
                            .labelsHidden()
                            .frame(height:90)
                            .clipped()
                            .padding()
                            
                        }
                    }
                    
                    Button(action: {
                        self.add_newItem()
                    }){
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 35))
                            .foregroundColor(.init(red: 110/255, green: 210/255, blue: 110/255))
                    }
                    
                    
                    
                    
                    
                    
                    Spacer()
                    
                }
            }
        }
        
    }
    func update_halfModal(title:String, placeholder:String, itemType:new_StepOrIngredient, height:CGFloat){
        halfModal_textField1_val = ""
        halfModal_textField2_val = ""
        halfModal_title = title
        halfModal_textField_placeholder = placeholder
        newItem_type = itemType
        halfModal_height = height
        
    }
    
    func possible_stringToDouble(_ stringToValidate:String) -> Double?{
        let val:Double? = Double(stringToValidate) ?? nil
        
        if let val = val {
            return val
        } else {
            return nil
        }
        
    }
    func hideModal(){
        
        UIApplication.shared.endEditing()
        halfModal_shown = false
    }
    
    func add_newItem(){
        if halfModal_textField2_val == "" {
            let alertView = SPAlertView(title: newItem_type == .Step ? "Please add a step" : "Please add an Ingredient", message: "Make sure no textfields are left blank", preset: SPAlertIconPreset.error)
          //  alertView.duration = 3 (fix) - not working
            alertView.present()
        } else {
            if newItem_type == .Step {
                steps.append(Step(description: halfModal_textField2_val,
                                  orderNumber: steps.count))
                
                hideModal()
                print("DEBUG : Steps - \(steps)")
            } else if newItem_type == .Ingredient{
                
                if let amount = possible_stringToDouble(halfModal_textField1_val) {
                    let thisIngredientUnit = IngredientUnit.allCases[ingredientUnit_index]
                    
                    ingredients.append(Ingredient(name: halfModal_textField2_val,
                                                  amount: amount,
                                                  amountUnit: thisIngredientUnit,
                                                  orderNumber: ingredients.count))
                    hideModal()
                    print("DEBUG : Steps - \(ingredients)")

                } else {
                    let alertView = SPAlertView(title: "Check the amount", message: "Please enter a number (i.e. \"1\" or \"3.4\")", preset: SPAlertIconPreset.error)
               //     alertView.duration = 3  (fix) - not working
                    alertView.present()
                }
                
            }
        }
    }
}


struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView()
    }
}
