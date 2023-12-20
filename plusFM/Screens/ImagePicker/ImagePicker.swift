//
//  ImagePicker.swift
//  plusFM
//
//  Created by Michael Hany on 19/12/2023.
//

import SwiftUI

class ImagePickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @Binding var image: UIImage?

    init(image: Binding<UIImage?>) {
        _image = image
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            image = selectedImage

            // Convert UIImage to Data
            if let imageData = selectedImage.jpegData(compressionQuality: 1.0) {
                // Save Data to UserDefaults
                UserDefaults.standard.set(imageData, forKey: "Data")
                UserDefaults.standard.set("Custom", forKey: "Background")
            }
        }

        picker.dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    @Environment(\.presentationMode) private var presentationMode

    func makeCoordinator() -> ImagePickerCoordinator {
        return ImagePickerCoordinator(image: $image)
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    func onImagePicked(perform action: @escaping () -> Void) -> Self {
        return self
    }
}

