//
//  LoginView.swift
//  Grandmas Recipes
//
//  Created by Darrien Huntley on 3/6/21.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var authVM = AuthViewModel()

    
    @State var username = ""
    @State var password = ""

    @State var signUp_visible = false
    
    var body: some View {
        VStack(spacing: 0) {
            Image("loginImage1")
                .resizable()

                .scaledToFill()
                .frame(height: 350)

                .clipShape((Rectangle()))
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(Color.blue)
                .edgesIgnoringSafeArea(.top)
            
            TextField("Username", text: $username)
                .padding()
                .background(Color.clear)
            
            TextField("Password", text: $password)
                .padding()
                .background(Color.clear)
            
            Spacer()
                .frame(height: 20)
            
            Button(action: {
                authVM.login(username: username, password: password)
                
            }, label: {
                Text("Login")
            })
            .padding()
            .background(Color.green)
            
            Spacer()
            
            Button(action: {
                signUp_visible.toggle()
            }, label: {
                Text("Sign Up")
            })
            .padding()
            .background(Color.orange)
            .sheet(isPresented: $signUp_visible) {
                SignupView()
            }
            Spacer()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
