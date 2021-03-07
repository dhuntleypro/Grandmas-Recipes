//
//  CustomImagePickerWindow.swift
//  Grandmas Recipes
//
//  Created by Darrien Huntley on 3/6/21.
//

import SwiftUI

struct CustomImagePickerWindow: View {
    
    @Binding var image : UIImage?
    @Binding var sourceType : UIImagePickerController.SourceType

    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(0..<8) { _ in
                        Rectangle()
                            .frame(width: 200, height: 200)
                            .background(Color.red)
                    }
                }
                .padding()
            }
            .frame( height: 240)
            .background(Color.blue)
        
           // Image Picker
            MultipleImagePicker(image: $image , sourceType : sourceType)
        }
    }
}

