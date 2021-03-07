//
//  GlobalFuncs.swift
//  Grandmas Recipes
//
//  Created by Darrien Huntley on 3/7/21.
//

import SwiftUI

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


