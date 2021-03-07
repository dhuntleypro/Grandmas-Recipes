//
//  Step.swift
//  Grandmas Recipes
//
//  Created by Darrien Huntley on 3/6/21.
//

import SwiftUI
import Firebase


struct Step: Identifiable {
   var id: String
   var description: String
   var orderNumber: Int

    
    init(dictionary : [String: Any]) {
        self.id = dictionary["uid"] as? String ?? ""
        self.description = dictionary["description"] as? String ?? ""
        self.orderNumber = dictionary["orderNumber"] as? Int ?? 0


    }
}


