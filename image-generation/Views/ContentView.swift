//
//  ContentView.swift
//  image-generation
//
//  Created by Nathan Schroeder on 2025-03-27.
//

import SwiftUI

struct ContentView: View {
    @State private var hasStarted = false
    
    var body: some View {
        ZStack{
            if hasStarted {
                HomeView()
                    .transition(
                        .move(edge: .bottom)
                    )
                
            } else {
                GetStartedView(hasStarted: $hasStarted)
                    .transition(
                        .move(edge: .top)
                    )
                
            }
        }
        .animation(.easeInOut, value: hasStarted)
        
    }
}


#Preview {
    ContentView()
}
