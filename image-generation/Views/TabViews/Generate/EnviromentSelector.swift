//
//  EnviromentSelector.swift
//  image-generation
//
//  Created by Nathan Schroeder on 2025-03-29.
//

import SwiftUI

struct EnviromentSelector: View {
    let environments = ["Interior", "Exterior"]
    
    @Binding var selectedEnvironment: String
    @Namespace private var animation
    
    var body: some View {
        ZStack(alignment: .leading) {
            // Background
            RoundedRectangle(cornerRadius: 8)
                .fill(Color("SecondaryColor").opacity(0.3))
                .frame(height: 50)
            
            // Selection indicator
            RoundedRectangle(cornerRadius: 8)
                .fill(Color("PrimaryColor"))
                .frame(width: UIScreen.main.bounds.width / 2 - 20, height: 50) // Adjust width based on your padding
                .offset(x: selectedEnvironment == "Interior" ? 0 : UIScreen.main.bounds.width / 2 - 20)
                .animation(.spring(response: 0.3, dampingFraction: 0.7), value: selectedEnvironment)
            
            // Text buttons
            HStack(spacing: 0) {
                ForEach(environments, id: \.self) { environment in
                    Text(environment)
                        .font(Font.custom("Poppins-Medium", size: 16))
                        .foregroundColor(selectedEnvironment == environment ? .white : .primary)
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            selectedEnvironment = environment
                        }
                }
            }
        }
        .frame(height: 50)
        .background(Color("SecondaryColor").opacity(0.3))
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}
