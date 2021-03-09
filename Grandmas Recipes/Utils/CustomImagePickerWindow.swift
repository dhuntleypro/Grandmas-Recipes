//
//  CustomImagePickerWindow.swift
//  Grandmas Recipes
//
//  Created by Darrien Huntley on 3/6/21.
//

import SwiftUI

struct CustomImagePickerWindow: View {
    
    @Binding var images: [Identifiable_UIImage]
    @Binding var sourceType : UIImagePickerController.SourceType
    @Binding var showImagePicker : Bool
    
    var body: some View {
        VStack(spacing:0){
            if images.count > 0 {
                ScrollView(.horizontal){
                    HStack{
                        ForEach(self.images, id: \.id){i in
                            Image(uiImage:i.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height:200)
                                .shadow(radius:3)
                        }
                        
                    }.padding()
                }
                .frame(height:240)
                .background(Color.white)
            } else {
                HStack{
                    Spacer()
                    Text("Please select an image from below")
                    
                    
                    Spacer()
                }
                .frame(height:240)
                .background(Color.white)
            }
            HStack{
                Button(action: {self.showImagePicker.toggle()}){
                    if images.count == 1 {
                        Text("DONE \(self.images.count) IMAGE")
                            .padding()
                            .font(.system(size:12, weight:.bold))
                            .foregroundColor(.white)
                            .frame(height:24)
                            .background(Color.black)
                            .cornerRadius(12)
                    } else {
                    Text("DONE \(self.images.count) IMAGES")
                        .padding()
                        .font(.system(size:12, weight:.bold))
                        .foregroundColor(.white)
                        .frame(height:24)
                        .background(Color.black)
                        .cornerRadius(12)
                    }
                    
                    
                }
            }.frame(height:57).frame(maxWidth: .infinity).background(Color.white)
            .zIndex(1)
            // Image Picker
            MultipleImagePicker(images: $images , sourceType : sourceType)
                .offset(y: -57)
        }
    }
}

