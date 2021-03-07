//
//  Step.swift
//  Grandmas Recipes
//
//  Created by Darrien Huntley on 3/6/21.
//

import SwiftUI
import Firebase


struct Step: Identifiable {
    var id = UUID()
    var description: String
    var orderNumber: Int
    var dictionary: [String: Any] {
        return [
            "id": id.uuidString,
            "description": description,
            "orderNumber":orderNumber
        ]
    }
    
}

//// FIREBASE ( coverts for firebase string : Any )
//extension Array where Element == Step {
//    func formatForFirebase() -> [[String:Any]]{
//        var returnVal:[[String:Any]] = []
//        for element in self {
//            returnVal.append(element.dictionary)
//        }
//        
//        return returnVal
//    }
//
//}
