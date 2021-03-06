//
//  Extension+Color.swift
//  Grandmas Recipes
//
//  Created by Darrien Huntley on 3/6/21.
//



import SwiftUI

var lightBlue = Color.init(red: 91/255, green: 152/255, blue: 198/255)
var darkBlue = Color.init(red: 47/255, green: 75/255, blue: 135/255)
var vDarkBlue = Color.init(red: 2/255, green: 51/255, blue: 92/255)


extension Color {
    
    static var theme: Color  {
        return Color("theme")
    }
    
    static var error: Color  {
        return Color("error")
    }
    
    static var success: Color  {
        return Color("success")
    }
    
    static var warning: Color  {
        return Color("warning")
    }
    
    static var solidButtontext: Color  {
        return Color("solidButtontext")
    }
    
    static var textHeaderPrimary: Color  {
        return Color("textHeaderPrimary")
    }
    
    static var textHeaderSecondary: Color  {
        return Color("textHeaderSecondary")
    }
    
    static var textParagraph: Color  {
        return Color("textParagraph")
    }
    
    static var teal: Color  {
        return Color("teal")
    }
    static var darkModeTealB: Color  {
        return Color("darkModeTealB")
    }
    static var darkblue: Color  {
        return Color("darkblue")
    }
    
    
}
