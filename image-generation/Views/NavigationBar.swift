//
//  NavigationBar.swift
//  image-generation
//
//  Created by Nathan Schroeder on 2025-03-29.
//

import SwiftUI

struct NavigationBar: View {
    var title: String
    
    
    
    var body: some View {
        ZStack {
            HStack {
                Text(title)
                    .font(Font.custom("Poppins-Medium", size: 20))
                    .foregroundStyle(Color("TextColor"))

            }
        }
        .frame(height: 50)
        .padding(.bottom, 10.0) // allows title to be in center by taking half its height
    }
}

#Preview {
    HomeView()
}
