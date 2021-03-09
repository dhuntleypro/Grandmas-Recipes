//
//  trunc_RecipePost.swift
//  Grandmas Recipes
//
//  Created by Darrien Huntley on 3/8/21.
//

import SwiftUI

// Quick Info of Recipe 
struct trunc_RecipePost: Identifiable {
    var id = UUID()
    var title: String
    var description: String
    
    var dictionary: [String: Any] {
        return [
            "id": id.uuidString,
            "title": title,
            "description": description
        
        
        ]
    }

}
