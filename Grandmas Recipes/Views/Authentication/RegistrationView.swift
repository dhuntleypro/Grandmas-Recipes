//
//  SignupView.swift
//  Grandmas Recipes
//
//  Created by Darrien Huntley on 3/6/21.
//

import SwiftUI

struct RegistrationView: View {
    @State var email = ""
    @State var password = ""
    @State var fullname = ""
    @State var usernaame = ""
    
    

    // Firebase
    //@ObservedObject var viewModel = AuthViewModel()
    @EnvironmentObject var viewModel: AuthViewModel

    
    
    // Which view is being presented and dismiss a screen
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @State var showImagePicker = false
    @State var selectedUIImage: UIImage?
    @State var image : Image?
    
    func loadImage() {
        guard let selectedImage  = selectedUIImage else { return }
        image = Image(uiImage: selectedImage)
    }
    var body: some View {
        ZStack {
            VStack {
                Button(action: {
                    showImagePicker.toggle()
                }, label: {
                    ZStack {
                        if let image = image {
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 140, height: 140)
                                .clipped()
                                .cornerRadius(70)
                                .padding(.top, 88)
                                .padding(.bottom, 16)
                                
                        } else {
                        Image("plus_photo")
                            .resizable()
                            .renderingMode(.template)
                            .scaledToFill()
                            .frame(width: 140, height: 140)
                            .padding(.top, 88)
                            .padding(.bottom, 16)
                            .foregroundColor(.white)
                        }
                    }
                    
                    
                })
                .sheet(isPresented: $showImagePicker, onDismiss: loadImage, content: {
                    ImagePicker(image: $selectedUIImage)
                })
                
                
                
                VStack(spacing: 8) {
                    
                    // FULLNAME
                    CustomTextField(text: $fullname, placeholder: Text("Full Name") , imageName: "person")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    
                    // EMAIL
                    CustomTextField(text: $email, placeholder: Text("Email") , imageName: "envelope")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    
                    // USERNAME
                    CustomTextField(text: $usernaame, placeholder: Text("Username") , imageName: "person")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        
                    
                    // PASSWORD
                    CustomSecureField(text: $password, placeholder: Text("Password"))
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)

                }
                .padding(.horizontal, 32)
                
              
                
                Button(action: {
                    guard let image = selectedUIImage else { return }
                    
                    viewModel.register(email: email,
                                       password: password,
                                       username: usernaame,
                                       fullname: fullname,
                                       profileImage: image
                    )
                }, label: {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundColor(.blue)
                        .frame(width: 360, height: 50)
                        .background(Color.white)
                        .clipShape(Capsule())
                        .padding()
                })
                
                
                Button(action: {
                    
                    mode.wrappedValue.dismiss()

                }, label: {
                    HStack {
                       Text("Already have an account")
                        .font(.system(size: 14))

                        Text("Sign In")
                            .font(.system(size: 13 , weight: .semibold))

                    }
                    .foregroundColor(.white)
                    .padding(.bottom, 40)
                    
                })
                
                Spacer()

        
            }
        }
        .background(Color(.systemOrange))
        .edgesIgnoringSafeArea(.all)
        
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
