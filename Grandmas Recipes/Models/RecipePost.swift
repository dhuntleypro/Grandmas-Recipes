//
//  RecipePost.swift
//  Grandmas Recipes
//
//  Created by Darrien Huntley on 3/6/21.
//

import SwiftUI

struct RecipePost: Identifiable {
   // var id: String
    var id = UUID()
    var steps : [Step]
    var ingredients : [Ingredient]
    var postingUser: String
    var description: String
    var numberOfLikes: Int
    var image: Image
    
    var dictionary: [String: Any] {
        return [
            "id": id.uuidString,
            "steps": steps.formatForFirebase(),
            "ingredients": ingredients.formatForFirebase(),
            "postingUser":postingUser,
            "description":description,
            "numberOfLikes": numberOfLikes
        ]
    }
    
//    init(dictionary : [String: Any]) {
//        self.id = dictionary["uid"] as? String ?? ""
//        self.steps = dictionary["steps"] as! [Step]
//        self.ingredients = dictionary["ingredients"] as! [Ingredient]
//        self.postingUser = dictionary["postingUser"] as? String ?? ""
//        self.description = dictionary["description"] as? String ?? ""
//        self.numberOfLikes = dictionary["numberOfLikes"] as? Int ?? 0
//        self.image = dictionary["image"] as! Image

 //   }
}
