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
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(environments, id: \.self) { environment in
                ZStack {
                    if selectedEnvironment == environment {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color("PrimaryColor"))
                            .frame(maxWidth: .infinity)
                    }
                    
                    Text(environment)
                        .font(Font.custom("Poppins-Medium", size: 16))
                        .foregroundColor(selectedEnvironment == environment ? .white : .primary)
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity)
                        .contentShape(Rectangle()) // Improves tap target
                }
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.25)) {
                        selectedEnvironment = environment
                    }
                }
            }
        }
        .frame(maxHeight: 50)
        .background(Color("SecondaryColor").opacity(0.3))
        .clipShape(RoundedRectangle(cornerRadius: 8))    }
}

