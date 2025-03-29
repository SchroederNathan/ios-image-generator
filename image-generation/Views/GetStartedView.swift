//
//  GetStartedView.swift
//  image-generation
//
//  Created by Nathan Schroeder on 2025-03-28.
//

import SwiftUI

struct GetStartedView: View {
    @Binding var hasStarted: Bool
    
    var body: some View {
        VStack {
            Group{
                Text("Images go here")
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("Generate Images \nin Your Pocket")
                        .font(Font.custom("Poppins-Medium", size: 34))
                        .lineLimit(nil)
                        .foregroundColor(Color("TextColor"))
                        .fixedSize(horizontal: false, vertical: true)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("This is some random text on what this app really does. Something about generating em")
                        .font(Font.custom("Poppins-Regular", size: 20))
                        .foregroundColor(Color("TextColor"))
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                .padding()
                .padding(.top, 60.0)
                
                Button(action: {
                    hasStarted = true
                }, label: {
                    Text("Get Started")
                        .font(Font.custom("Poppins-Regular", size: 20))
                        .fontWeight(.medium)
                        .foregroundColor(Color("BackgroundColor"))
                        .frame(maxWidth: .infinity, minHeight: 60)
                        .background(Color("PrimaryColor"))
                        .cornerRadius(16)
                        .padding()
                })
            }.frame(maxHeight: .infinity, alignment: .bottom)
            
        }
    }
    
}
