//
//  MultipleImagePicker.swift
//  Grandmas Recipes
//
//  Created by Darrien Huntley on 3/6/21.
//

import SwiftUI

struct MultipleImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    
    typealias UIViewControllerType = UIImagePickerController
    typealias Coordinator = imagePickerCoordinator

    var sourceType: UIImagePickerController.SourceType = .camera

    func makeUIViewController(context: UIViewControllerRepresentableContext <MultipleImagePicker>) -> UIImagePickerController {
        
        let picker = UIImagePickerController()
        picker.sourceType = sourceType
        picker.delegate = context.coordinator
        return picker
    }
    
    
    func makeCoordinator() -> MultipleImagePicker.Coordinator {
        return imagePickerCoordinator(image: $image)
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<MultipleImagePicker>) {
        
    }
}

//extension MultipleImagePicker {
    class imagePickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
        @Binding var image: UIImage?
        
        init(image: Binding<UIImage?>) {
            _image = image
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            // allows for the changing of the image
            if let uiimage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                image = uiimage
            }
            
        }
    }
//}
