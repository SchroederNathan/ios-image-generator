//
//  ImagePicker.swift
//  image-generation
//
//  Created by Nathan Schroeder on 2025-03-29.
//

import PhotosUI
import SwiftUI

struct ImagePicker: View {
    
    @Binding var selectedImage: UIImage?
    
    @State private var photosPickerItem: PhotosPickerItem?
    
    var body: some View {
        if let selectedImage {
            // Display the selected image
            ZStack(alignment: .bottomTrailing) {
                // Display the selected image
                Image(uiImage: selectedImage)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(8)
                
                // Button to remove the image
                Button(action: {
                    self.selectedImage = nil // Clear the image
                }, label: {
                    Image(systemName: "trash")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.red)
                        .clipShape(Circle())
                        .padding(8)
                })
                .shadow(color: .black.opacity(0.5), radius: 3, x: 0, y: 0)
            }
            .frame(maxWidth: .infinity)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
            
        } else {
            VStack {
                
                // Show the regular picker UI when no image is selected
                Text("Transform Your Space")
                    .font(Font.custom("Poppins-Bold", size: 24))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 2.0)
                
                Text("We'll analyze and redesign your space instantly.")
                    .font(Font.custom("Poppins-Medium", size: 16))
                    .multilineTextAlignment(.center)
                
                PhotosPicker(selection: $photosPickerItem, matching: .images) {
                    Label("Upload Image", systemImage: "plus")
                        .font(Font.custom("Poppins-Regular", size: 16))
                        .fontWeight(.medium)
                        .foregroundColor(Color("TextColor"))
                        .frame(maxWidth: 200, minHeight: 50)
                        .background(Color("PrimaryColor"))
                        .cornerRadius(32)
                        .padding()
                }
                .onChange(of: photosPickerItem) { _, newItem in
                    Task {
                        if let newItem,
                           let data = try? await newItem.loadTransferable(type: Data.self),
                           let image = UIImage(data: data) {
                            selectedImage = image
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 24)
            .padding(.horizontal, 20)
            .background(Color("SecondaryColor").opacity(0.3))
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
        }
        
    }
}
