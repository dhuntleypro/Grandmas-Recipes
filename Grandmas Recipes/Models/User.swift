//
//  User.swift
//  Grandmas Recipes
//
//  Created by Darrien Huntley on 3/6/21.
//

import Firebase

struct User: Identifiable {
    let id: String
    let username: String
    let profileImageURL: String
    let fullname: String
    let email: String
    
    var isCurrentUser: Bool { return Auth.auth().currentUser?.uid == self.id }
    
    init(dictionary : [String: Any]) {
        self.id = dictionary["uid"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        self.profileImageURL = dictionary["profileImageURL"] as? String ?? ""
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
    }
}
