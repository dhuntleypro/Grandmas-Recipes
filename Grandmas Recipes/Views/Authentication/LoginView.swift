//
//  LoginView.swift
//  Grandmas Recipes
//
//  Created by Darrien Huntley on 3/6/21.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    
 //   @ObservedObject var viewModel = AuthViewModel()
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Image("twitter-logo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 220, height: 100)
                        .padding(.top, 88)
                        .padding(.bottom)
                    
                    
                    
                    
                    VStack(spacing: 8) {
                        CustomTextField(text: $email, placeholder: Text("Email") , imageName: "envelope")
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                        
                        CustomSecureField(text: $password, placeholder: Text("Password"))
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                        
                    }
                    .padding(.horizontal, 32)
                    
                    HStack {
                        Spacer()
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("Forgot Password?")
                                .font(.footnote)
                                .bold()
                                .foregroundColor(.white)
                                .padding(.top, 16)
                                .padding(.trailing, 32)
                        })
                    }
                    
                    Button(action: {
                        viewModel.login(withEmail: email, password: password)
                    }, label: {
                        Text("Sign In")
                            .font(.headline)
                            .foregroundColor(.blue)
                            .frame(width: 360, height: 50)
                            .background(Color.white)
                            .padding()
                            .cornerRadius(10)
                    })
                    
                    
                    // APPLE
                    SignInWithAppleView()
                        .frame(width: 360, height: 50)

                    
                    
                    
                    NavigationLink(destination: RegistrationView().navigationBarBackButtonHidden(true)) {
                        HStack {
                            Text("Don't have an account?")
                                .font(.system(size: 14))
                            
                            Text("Sign Up")
                                .font(.system(size: 13 , weight: .semibold))
                            
                        }
                        .foregroundColor(.white)
                        .padding(.bottom, 40)
                    }
                    
                    Spacer()

                    
                }
            }
            .background(Color(.systemOrange))
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
