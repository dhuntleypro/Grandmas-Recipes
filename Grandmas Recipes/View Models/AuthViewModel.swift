//
//  AuthViewModel.swift
//  Grandmas Recipes
//
//  Created by Darrien Huntley on 3/6/21.
//

import SwiftUI
import Firebase


class AuthViewModel: ObservableObject {
    @Published var users = [User]()

    init() {
        
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

            }
        }
        
        
        
        
    }
}
