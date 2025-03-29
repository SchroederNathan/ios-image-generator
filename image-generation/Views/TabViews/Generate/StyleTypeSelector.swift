//
//  StyleTypeSelector.swift
//  image-generation
//
//  Created by Nathan Schroeder on 2025-03-29.
//

import SwiftUI

struct StyleTypeSelector: View {
    @Binding var selectedStyleType: String
    @Environment(\.dismiss) var dismiss
    
    let styleTypes = [
        "Modern",
        "Traditional",
        "Minimalist",
        "Industrial",
        "Rustic",
        "Coastal",
        "Bohemian",
        "Scandinavian",
        "Contemporary",
        "Classic",
        "Brutalist"
    ]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(styleTypes, id: \.self) { styleType in
                    Button(action: {
                        selectedStyleType = styleType
                        dismiss()
                    }) {
                        HStack {
                            Text(styleType)
                                .font(Font.custom("Poppins-Regular", size: 16))
                                .foregroundColor(Color("TextColor"))
                            
                            Spacer()
                            
                            if selectedStyleType == styleType {
                                Image(systemName: "checkmark")
                                    .foregroundColor(Color("PrimaryColor"))
                            }
                        }
                    }
                    .padding(.vertical, 8)
                }
            }
            .navigationTitle("Select Style Type")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
}
