//
//  NavigationBar.swift
//  image-generation
//
//  Created by Nathan Schroeder on 2025-03-29.
//

import SwiftUI

struct NavigationBar<Title: View, Leading: View, Trailing: View>: View {
    
    
    // MARK: - Init
    
    init(@ViewBuilder title: () -> Title, leading: () -> Leading = { EmptyView() }, trailing: () -> Trailing = { EmptyView() }) {
        self.title = title()
        self.leading = leading()
        self.trailing = trailing()
    }
    
    // MARK: - Properties
    
    var title: Title
    var leading: Leading
    var trailing: Trailing
    
    
    var body: some View {
        ZStack {
            
            HStack(spacing: 0) {
                leading
                    .padding()
                    .foregroundColor(Color("TextColor"))
                Spacer()
                trailing
                    .padding()
                    .foregroundColor(Color("TextColor"))
            }
            HStack {
                title
                    .padding()
                    .font(Font.custom("Poppins-Medium", size: 20))
                    .foregroundStyle(Color("TextColor"))
            }
        }
        .foregroundStyle(Color.black)
        .frame(height: 50)
        .padding(.bottom, 10.0)
        
    }
    
}


#Preview {
    HomeView()
}
