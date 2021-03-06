//
//  AuthViewModel.swift
//  Grandmas Recipes
//
//  Created by Darrien Huntley on 3/6/21.
//

import SwiftUI
import Firebase
import SPAlert

class AuthViewModel: ObservableObject {
    @Published var users = [User]()
    @Published var userSession : FirebaseAuth.User?  // keep track if user is logged in
    
    
    init() {
        userSession = Auth.auth().currentUser
        
        fetchUser()
    }
    
    
    func fetchUser() {
        
    }
    
    func register(name: String, username: String, email: String ,password: String ) {
        
        let docRef = Firestore.firestore().document("users/\(UUID().uuidString)")
        
        let dataSource = [
            "id" : "",
            "name" : name,
            "username" : username,
            "email" : email,
            "password" : password
        ]
        
        
        docRef.setData(dataSource) { error in
            if let error = error {
                print(error)
            } else {
                print("New User Created!")
                
                // Visual success on screen
                let alertView = SPAlertView(title: "Account Created successfully", message: "Welcome to your account", preset: SPAlertIconPreset.done)
                alertView.present(duration: 3)
                alertView.present()
                
            }
        }
        
    }
    
    func login(username: String , password : String) {
        Firestore.firestore().collection("users").whereField("username", isEqualTo: username).getDocuments { querySnapshot, error in
            
            if let error = error {
                print("DEBUG: error getting documents: \(error)")
            } else {
                // Visual error on screen
                if querySnapshot!.documents.count <= 0 {
                    let alertView = SPAlertView(title: "No Users Found", message: "No Users Found", preset: SPAlertIconPreset.error)
                    alertView.present(duration: 3)
                    alertView.present()
                } else {
                    // Visual success on screen
                    let alertView = SPAlertView(title: "\(querySnapshot!.documents.count) users found)", message: "Welcome to your account", preset: SPAlertIconPreset.done)
                    alertView.present(duration: 3)
                    alertView.present()
                }
                
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                }
            }
        }
    }
    
//    func login(withEmail email: String , password: String)  {
//        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
//
//            if let error = error {
//                print("DEBUG: Fail to get document: \(error.localizedDescription)")
//                return
//
//            }
//
//            // LOGIN USER
//            self.userSession = result?.user
//            self.fetchUser()
//            print("DEBUG: Successfully logged in")
//
//        }
//
//    }
//
    
    
}
