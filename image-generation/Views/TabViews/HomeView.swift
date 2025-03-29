//
//  HomeView.swift
//  image-generation
//
//  Created by Nathan Schroeder on 2025-03-28.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedTab: Int = 0
    var body: some View {
        VStack(spacing: 0) {
            
            // Main content
            ZStack {
                switch selectedTab {
                case 0:
                    GenerateTabView()
                default:
                    Text("Page not found")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            HStack {
                TabBarButton(
                    icon: "sparkles",
                    selectedIcon: "sparkles",
                    title: "Generate",
                    isSelected: selectedTab == 0
                ) {
                    selectedTab = 0
                }
                .frame(maxWidth: .infinity)

                TabBarButton(
                    icon: "square.grid.2x2",
                    selectedIcon: "square.grid.2x2.fill",
                    title: "My Boards",
                    isSelected: selectedTab == 1
                ) {
                    selectedTab = 1
                }
                .frame(maxWidth: .infinity)

                TabBarButton(
                    icon: "person.circle",
                    selectedIcon: "person.circle.fill",
                    title: "Profile",
                    isSelected: selectedTab == 2
                ) {
                    selectedTab = 2
                }
                .frame(maxWidth: .infinity)
            }
            .padding(.horizontal, 30)
            .padding(.top, 12)

            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color("BackgroundColor"))
                    .shadow(radius: 5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                    )
                    .edgesIgnoringSafeArea(.bottom)
            )
            .edgesIgnoringSafeArea(.bottom)
            
        }
    }
}


#Preview {
    HomeView()
}
