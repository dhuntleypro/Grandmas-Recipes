//
//  Step.swift
//  Grandmas Recipes
//
//  Created by Darrien Huntley on 3/6/21.
//

import SwiftUI
import Firebase


struct Step: Identifiable {
   // var id: String
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
    
    
//    init(dictionary : [String: Any]) {
//        self.id = dictionary["uid"] as? String ?? ""
//        self.description = dictionary["description"] as? String ?? ""
//        self.orderNumber = dictionary["orderNumber"] as? Int ?? 0
//
//
//    }
}


