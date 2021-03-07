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
    @State var halfModal_Shown = false
    @State var halfModal_title : String = ""
    @State var halfModal_textField : String = ""
    @State var halfModal_placeholder : String = ""
    
    
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
                                    ForEach(0..<37) { _ in
                                        // ForEach(ingredientVM.ingredients) { ingredient in
                                        //   Text("\(ingredient.amount) \(ingredient.name) ")
                                        HStack {
                                            Text("fff uhuhh uhff")
                                            
                                            Spacer()
                                        }
                                    }
                                    .foregroundColor(Color.init(red: 108/255, green: 204/255, blue: 108/255))
                                }
                                .padding()
                            }
                            .frame(width: UIScreen.main.bounds.width/2)
                            .clipped()
                        }
                        .background(Color.black)
                        
                        
                        Button(action: {
                            self.halfModal_title = "ADD AN INGREDIENT"
                            self.halfModal_placeholder = "Enter new ingredient"
                            self.halfModal_Shown.toggle()
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
                                    ForEach(0..<37) { _ in
                                        // ForEach(stepVM.steps) { step in
                                        //    Text(step.description)
                                        
                                        HStack {
                                            Text("yoooo")
                                            
                                            Spacer()
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
                            self.halfModal_title = "ADD A STEP"
                            self.halfModal_placeholder = "Enter new step"

                            self.halfModal_Shown.toggle()
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
            HalfModalView(isShown: $halfModal_Shown, modalHeight: 380) {
                BottomModalView(halfModal_title: $halfModal_title, halfModal_textField: $halfModal_textField, halfModal_placeholder: $halfModal_placeholder)
            }
        }
        .navigationBarHidden(true)
        
    }
}

struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView()
    }
}
