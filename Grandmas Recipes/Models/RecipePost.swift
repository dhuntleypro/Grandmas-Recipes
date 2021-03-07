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
    
    // same only not init it allows me to make sample data
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

}

// FIREBASE ( coverts for firebase string : Any )
extension Array where Element == Step {
    func formatForFirebase() -> [[String:Any]]{
        var returnVal:[[String:Any]] = []
        for element in self {
            returnVal.append(element.dictionary)
        }
        
        return returnVal
    }

}


extension Array where Element == Ingredient {
    func formatForFirebase() -> [[String:Any]]{
        var returnVal:[[String:Any]] = []
        for element in self {
            returnVal.append(element.dictionary)
        }
        
        return returnVal
    }

}
