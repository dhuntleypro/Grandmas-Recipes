//
//  NewPostView.swift
//  Grandmas Recipes
//
//  Created by Darrien Huntley on 3/6/21.
//

import SwiftUI


struct NewPostView: View {
    @ObservedObject var stepVM = StepViewModel()
    @ObservedObject var ingredientVM = IngredientViewModel()
    
    @State var showSheet = false
    @State var showImagePicker = false
    @State var sourceType : UIImagePickerController.SourceType = .camera
    @State var image : UIImage?
    
    // BOTTOM MODAL
    @State var halfModal_shown = false
    
    
    @State var halfModal_title : String = ""
    @State var halfModal_textField1_val : String = ""
    @State var halfModal_textField2_val : String = ""

    @State var halfModal_textField_placeholder : String = ""
    @State var halfModal_height : CGFloat = 300

    @State var newItem_type : new_StepOrIngredient = .Step
    @State var ingredientUnit_index = 0

    // Sample Data
    @State var steps : [Step] = [
        
    ]
    
    @State var ingredients : [Ingredient] = [
        
    ]
    
    
    var body: some View {
        
        ZStack {
            VStack {
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
                                .background(Color.init(red: 0.95, green: 0.95, blue: 0.95))
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
                                .foregroundColor(.white)
                            
                            
                            ScrollView{
                                VStack(spacing: 0){
                                    if ingredients.count > 0 {
                                        
                                        ForEach(ingredientVM.ingredients) { ingredient in
                                            HStack {
                                                Text("\(ingredient.amount) \(ingredient.name) ")
                                                
                                                Spacer()
                                            }
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
                        .background(Color.black)
                        
                        
                        Button(action: {
                            self.update_halfModal(title: "ADD AN INGREDIENT", placeholder: "Enter new ingredient", itemType: .Ingredient, height: 470)
                            self.halfModal_shown.toggle()
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .padding()
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                                .opacity(0.7)
                        }
                    }
                    
                    ZStack(alignment: .topTrailing) {
                        VStack {
                            Text("Steps")
                                .padding(.top)
                            ScrollView{
                                VStack(spacing: 0){
                                    if steps.count < 0 {
                                        
                                        ForEach(stepVM.steps) { step in
                                            
                                            HStack {
                                                Text("\(step.orderNumber). " + step.description)
                                                
                                                Spacer()
                                            }
                                        }
                                    } else if steps.count >= 0 {
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
                        .background(Color.green)
                        
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
                    
                }
                
            }
            .sheet(isPresented: $showImagePicker) {
                CustomImagePickerWindow(image: $image, sourceType: $sourceType)
                // MultipleImagePicker(image: $image , sourceType : sourceType)
            }
            
            // half sheet
            HalfModalView(isShown: $halfModal_shown, modalHeight: halfModal_height) {
                BottomModalView(halfModal_title: $halfModal_title, halfModal_textField1_val: $halfModal_textField1_val, halfModal_textField2_val: $halfModal_textField2_val, halfModal_textField_placeholder: $halfModal_textField_placeholder, newItem_type: $newItem_type, ingredientUnit_index: $ingredientUnit_index)
            }
        }
        
    }
    func update_halfModal(title:String, placeholder:String, itemType:new_StepOrIngredient, height:CGFloat ){
        halfModal_title = title
        halfModal_textField_placeholder = placeholder
        newItem_type = itemType
        halfModal_height = height
        
    }
    
//    func add_newItem(){
//        if newItem_type == .Step {
//            //            steps.append(Step(description: halfModal_textField_val, orderNumber: steps.count))
//            steps.append(Step(dictionary: [
//                "description" : halfModal_textField_val,
//                "orderNumber" : steps.count
//            ]))
//        }
//        UIApplication.shared.endEditing()
//        halfModal_shown = false
//    }
}

struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView()
    }
}
