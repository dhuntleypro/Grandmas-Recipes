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
    @EnvironmentObject var authEO: AuthViewModel
    
    @ObservedObject var recipeVM = RecipeViewModel()
    
    @ObservedObject var stepVM = StepViewModel()
    @ObservedObject var ingredientVM = IngredientViewModel()
    
    @State var showSheet = false
    @State var showImagePicker = false
    @State var sourceType:UIImagePickerController.SourceType = .camera
    @State private var images:[Identifiable_UIImage] = []
    
    @State var halfModal_shown = false
    
    @State var halfModal_title = ""
    @State var halfModal_textField_placeholder = ""
    @State var halfModal_textField1_val = ""
    @State var halfModal_textField2_val = ""
    @State var halfModal_height:CGFloat = 380
    
    @State var newItem_type : new_StepOrIngredient = .Step
    @State var ingredientUnit_index = 0
    
    // Holds Data
    @State var steps:[Step] = []
    @State var ingredients:[Ingredient] = []
    
    
    var body: some View {
        
        ZStack {
            VStack(spacing: 0) {
                Spacer().frame(height: 65) //(fix) -- hard coded need to fit all apps
                ZStack(alignment: .topTrailing) {
                    HStack {
                        
                        if images.count > 0 {
                            ScrollView(.horizontal){
                                HStack(spacing:0){
                                    ForEach(self.images, id: \.id){ i in
                                        Image(uiImage: i.image)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width:UIScreen.main.bounds.size.width, height: 300)
                                        
                                    }
                                }.background(Color.black)
                            }.background(Color.black)
                            
                        } else {
                            Button(action: {
                                self.showSheet.toggle()
                                
                            }) {
                                Image("addFoodImage")
                                    .resizable()
                                    .scaledToFit()
                                    .padding(50)
                                    .frame(width: UIScreen.main.bounds.size.width, height: 300)
                                    .background(Color.init(red: 1, green: 1, blue: 1))
                            }
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
                                sourceType = .savedPhotosAlbum
                            }),
                            .cancel()
                            
                        ])
                    })
                    
                }
                VStack{
                    HStack(spacing: 0)  {
                        // Ingredients
                        ZStack(alignment: .topTrailing) {
                            // Ingredients
                            VStack {
                                Text("INGREDIENTS")
                                    .font(.headline)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.gray)
                                    .foregroundColor(.black)
                                
                                ScrollView{
                                    VStack(alignment:.leading){
                                        if ingredients.count > 0 {
                                            ForEach(ingredients, id: \.id) {thisIngredient in
                                                Text("\(thisIngredient.amount.stringWithoutZeroFraction) \(thisIngredient.amountUnit.rawValue) \(thisIngredient.name)")
                                                    .padding(5)
                                                    .padding(.leading, 3)
                                                    .padding(.trailing, 3)
                                                    .background(Color.init(red: 0.85, green: 0.85, blue: 0.85))
                                                    .padding(.bottom, 4)
                                                    .cornerRadius(5)
                                            }.foregroundColor(.init(red: 0.3, green: 0.3, blue: 0.3))
                                        } else {
                                            Button(action: {
                                                self.update_halfModal(title: "ADD AN INGREDIENT", placeholder: "Enter new ingredient", itemType: .Ingredient, height: 470)
                                                self.halfModal_shown = true
                                            }) {
                                                Text("Add some ingredients")
                                                    .padding()
                                                    .foregroundColor(.gray)
                                                    .multilineTextAlignment(.center)
                                                    .frame(maxWidth: .infinity)
                                            }
                                            
                                            
                                        }
                                        
                                    }
                                    .padding(5)
                                    Spacer()
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
                        
                        // Steps
                        ZStack(alignment: .topTrailing) {
                            // Steps
                            VStack {
                                Text("STEPS")
                                    .padding()
                                    .font(.headline)
                                    .frame(maxWidth: .infinity)
                                    .background(Color.gray)
                                
                                ScrollView{
                                    VStack(alignment:.leading){
                                        if steps.count > 0 {
                                            ForEach(steps, id: \.id) {thisStep in
                                                Text("\(thisStep.orderNumber + 1). " + thisStep.description)
                                                    .padding(5)
                                                    .padding(.leading, 3)
                                                    .padding(.trailing, 3)
                                                    .background(Color.init(red: 0.85, green: 0.85, blue: 0.85))
                                                    .padding(.bottom, 4)
                                            }
                                            .foregroundColor(.init(red: 0.3, green: 0.3, blue: 0.3))
                                        } else {
                                            Button(action: {
                                                self.update_halfModal(title: "ADD A STEP", placeholder: "Enter new step", itemType: .Step, height: 380)
                                                self.halfModal_shown = true
                                            }) {
                                                Text("Add some steps")
                                                    .padding()
                                                    .foregroundColor(.gray)
                                                    .multilineTextAlignment(.center)
                                                    .frame(maxWidth: .infinity)
                                            }
                                        }
                                        
                                    }
                                    .padding(5)
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
                                    .padding(.trailing,15)
                                    .font(.system(size: 20))
                                    .foregroundColor(.black)
                                    .opacity(0.7)
                            }
                        }
                        
                    }.background(Color.init(red : 0.95 , green: 0.95 , blue: 0.95))
                    
                    // SUBIT BUTTON
                    Button(action: {
                        
                        let actionsToComplete = 2 + self.images.count
                        var actionsCompleted = 0
                        
                        func check_success(){
                            print("\(actionsCompleted)/\(actionsToComplete)")
                            if actionsCompleted == actionsToComplete {
                                //Add a function to clear all the data on this page
                                let alertView = SPAlertView(title: "Recipe Submitted", message: "Recipe submitted successfully!", preset: SPAlertIconPreset.done)
                                //  alertView.duration = 3
                                alertView.present()
                                self.clearPage()
                            }
                        }
                        if self.images.count > 0 {
                            // check for user
                            guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
                           
                            if var user = AuthViewModel.shared.user {
                                
                                // data
                                let thisRecipePost = RecipePost(steps: self.steps,
                                                                ingredients: self.ingredients,
                                                                //  postingUser: Auth.auth().currentUser?.uid ?? "[ missing uid ]",
                                                                postingUser: currentUid,
                                                                description: "",
                                                                numberOfLikes: 0,
                                                                image: Image(uiImage: self.images[0].image)
                                                                
                                )
                                
                                print("DEBUG: thisRecipePost -- \(thisRecipePost)")
                                
                                // update thisRecipePost.id
                                user.publishedRecipes.append(thisRecipePost.id.uuidString)
                                
                                // save thisRecipePost to ....
                                firestoreSubmit_data(docRef_string: "recipe/\(thisRecipePost.id)", dataToSave: thisRecipePost.dictionary, completion: {_ in
                                    
                                    actionsCompleted += 1
                                    check_success()
                                    
                                })
                                
                                
                                // update publishedRecipes
                                firestoreUpdate_data(docRef_string: "users/\(currentUid)", dataToUpdate: ["publishedRecipes": user.publishedRecipes], completion: { _ in
                                    
                                    actionsCompleted += 1
                                    check_success()
                                })
                            
                            
                            // upload images
                            for i in 0...self.images.count-1 {
                                let image = self.images[i].image
                                uploadImage("recipe_\(thisRecipePost.id)_\(i)", image: image, completion: {_ in
                                    actionsCompleted += 1
                                    check_success()
                                    
                                })
                            }
                            
                            }
                            
                            
                            
                        } else {
                            let alertView = SPAlertView(title: "Add a photo", message: "You cannot submit a recipe without a photo", preset: SPAlertIconPreset.error)
                            //   alertView.duration = 3
                            alertView.present()
                            
//
//                            print("DEBUG2: publishedRecipes -- \(user.publishedRecipes)")
//                            // Alert - Recipe Submitted
//                            let alertView = SPAlertView(title: "Recipe Submitted", message: "Recipe Submitted successfully", preset: SPAlertIconPreset.done)
//                            alertView.present()
//
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
            }
            .sheet(isPresented: $showImagePicker) {
                CustomImagePickerWindow(images: $images, sourceType: $sourceType, showImagePicker: $showImagePicker)
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
    
    func clearPage(){
        images.removeAll()
        halfModal_textField1_val = ""
        halfModal_textField2_val = ""
        ingredients = []
        steps = []
    }
}


struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView()
    }
}
