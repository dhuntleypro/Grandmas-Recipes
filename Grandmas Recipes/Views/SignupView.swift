//
//  SignupView.swift
//  Grandmas Recipes
//
//  Created by Darrien Huntley on 3/6/21.
//

import SwiftUI

struct SignupView: View {
    @ObservedObject var authVM = AuthViewModel()
    
    @State private var name : String = ""
    @State private var username : String = ""
    @State private var email : String = ""
    @State private var password : String = ""

    
    var body: some View {
        ZStack {
            
            Image("loginImage1")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width )
                .blur(radius: 5.0)
                .edgesIgnoringSafeArea(.all)
            
            
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.blue , Color.white]), startPoint: .leading, endPoint: .trailing).opacity(0.2)
                LinearGradient(gradient: Gradient(colors: [Color.black , Color.white]), startPoint: .top, endPoint: .bottom).opacity(0.2)
                Color.white.opacity(0.7)
                
            }
            .edgesIgnoringSafeArea(.all)
            
            
            
            VStack(spacing: 0) {
                HStack {
                    Text("Grandma's Recipes")
                        .font(.system(size: 55, weight: .semibold, design: .rounded))
                        .bold()
                        .shadow( color: Color.black , radius: 1)
                    
                    Spacer()
                }
                
                Spacer().frame(height: 50)
                
                Group {
                    TextField("Name", text: $name)
                        .frame(height: 40)
                    
                    Rectangle().frame(height: 2).foregroundColor(.black).opacity(0.5)
                    
                    TextField("Email", text: $email)
                        .frame(height: 40)
                    
                    Rectangle().frame(height: 2).foregroundColor(.black).opacity(0.5)
                    
                    TextField("Password", text: $password)
                        .frame(height: 40)
                    
                    Rectangle().frame(height: 2).foregroundColor(.black).opacity(0.5)
                    
                    TextField("Username", text: $username)
                        .frame(height: 40)
                    
                    Rectangle().frame(height: 2).foregroundColor(.black).opacity(0.5)
                    
                }
                Button(action: {
                    authVM.register(name: name, username: username, email: email, password: password)
                }) {
                    VStack{
                        Text("Sign up")
                        Image(systemName: "checkmark")
                    }
                }
                
            }
            .padding()
            
        }
        
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
