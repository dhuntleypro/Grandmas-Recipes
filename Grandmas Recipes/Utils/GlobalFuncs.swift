//
//  GlobalFuncs.swift
//  Grandmas Recipes
//
//  Created by Darrien Huntley on 3/7/21.
//

import Foundation
import SwiftUI
import Combine
import Firebase

// USE ANYWHERE IN CODE

// HIDE THE KEYBOARD  
extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}


// MEASURES SCROLLABLE MOVEMENT
func fraction_progress(lowerLimit: Double = 0, upperLimit:Double, current:Double, inverted:Bool = false) -> Double{
    var val:Double = 0
    if current >= upperLimit {
        val = 1
    } else if current <= lowerLimit {
        val = 0
    } else {
        val = (current - lowerLimit)/(upperLimit - lowerLimit)
    }
    
    if inverted {
        return (1 - val)
        
    } else {
        return val
    }
    
}


// CHECK FOR DRAGGING
enum DragState {
    case inactive
    case dragging(translation: CGSize)
    
    var translation: CGSize {
        switch self {
        case .inactive:
            return .zero
        case .dragging(let translation):
            return translation
        }
    }
    
    var isDragging: Bool {
        switch self {
        case .inactive:
            return false
        case .dragging:
            return true
        }
    }
}


extension Double {
    var stringWithoutZeroFraction: String {
        return truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}

func firestoreSubmit_data(docRef_string:String, dataToSave:[String:Any], completion: @escaping (Any) -> Void, showDetails: Bool = false){
    
    let docRef = Firestore.firestore().document(docRef_string)
    print("setting data")
    docRef.setData(dataToSave){ (error) in
        if let error = error {
            print("error = \(error)")
            completion(error)
        } else {
            print("data uploaded successfully")
            if showDetails {
                print("dataUploaded = \(dataToSave)")
            }
            
        }
    }
}

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
