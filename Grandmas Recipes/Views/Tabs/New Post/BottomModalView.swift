//
//  BottomModalView.swift
//  Grandmas Recipes
//
//  Created by Darrien Huntley on 3/7/21.
//

import SwiftUI

struct BottomModalView: View {
    @Binding var halfModal_title : String
    @Binding var halfModal_textField : String
    @Binding var halfModal_placeholder : String
    
    var body: some View {
        VStack {
            Spacer().frame(height: 15)
            
            Text("\(self.halfModal_title)")
                .font(.headline)
            TextField("\(self.halfModal_placeholder)" , text: $halfModal_textField)
                .padding(10)
                .background(
                    Rectangle()
                        .cornerRadius(10)
                        .foregroundColor(Color.init(red: 0.95, green: 0.95, blue: 0.95))
                    
                )
                .padding(20)
            
            Image(systemName: "plus.circle.fill")
                .font(.system(size: 35))
                .foregroundColor(.init(red: 110/255 , green: 210/255 , blue : 110/255))
            
            Spacer()
        }
    }
}

struct BottomModalView_Previews: PreviewProvider {
    static var previews: some View {
        BottomModalView(halfModal_title: .constant(""), halfModal_textField: .constant(""), halfModal_placeholder: .constant(""))
    }
}
