//
//  GlobalFuncs.swift
//  Grandmas Recipes
//
//  Created by Darrien Huntley on 3/7/21.
//

import Foundation
import SwiftUI
import Combine
import FirebaseStorage
import FirebaseFirestore
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
        } else {
            print("data uploaded successfully")
            if showDetails {
                print("dataUploaded = \(dataToSave)")
            }
            completion(true)

        }
    }
}

func firestoreUpdate_data(docRef_string:String, dataToUpdate:[String:Any], completion: @escaping (Any) -> Void, showDetails: Bool = false){
    
    let docRef = Firestore.firestore().document(docRef_string)
    print("updating data")
    docRef.setData(dataToUpdate, merge: true){ (error) in
        if let error = error {
            print("error = \(error)")
            
        } else {
            print("data uploaded successfully")
            if showDetails {
                print("dataUploaded = \(dataToUpdate)")
            }
            completion(true)
        }
    }
}


// uoload image to firebase
func uploadImage(_ referenceString:String, image:UIImage, completion: @escaping (Any) -> Void, showDetails: Bool = false){
    if let imageData = image.jpegData(compressionQuality: 1){
        let storage = Storage.storage()
        storage.reference().child(referenceString).putData(imageData, metadata: nil){
            (strgMtdta, err) in
            
            if let err = err {
                print("an error has occurred - \(err.localizedDescription)")
            } else {
                print("image uploaded successfully")
                completion(true)

            }
        }
    } else {
        print("couldn't unwrap image as data")
    }
    
    
}

