//
//  RoomTypeSelector.swift
//  image-generation
//
//  Created by Nathan Schroeder on 2025-03-29.
//

import SwiftUI

// Room type selection view
struct RoomTypeSelector: View {
    @Binding var selectedRoomType: String
    @Binding var environment: String
    
    @Environment(\.dismiss) var dismiss
    
    let interiorRoomTypes = [
        "Living Room",
        "Bedroom",
        "Kitchen",
        "Bathroom",
        "Dining Room",
        "Home Office",
        "Entryway",
        "Hallway",
        "Kids Room",
        "Guest Room",
        "Laundry Room",
        "Basement",
        "Attic",
        "Closet",
        "Pantry"
    ]

    let exteriorSpaceTypes = [
        "Patio",
        "Garden",
        "Backyard",
        "Front Yard",
        "Deck",
        "Balcony",
        "Terrace",
        "Pool Area",
        "Outdoor Kitchen",
        "Gazebo",
        "Porch",
        "Driveway",
        "Walkway",
        "Courtyard",
        "Rooftop"
    ]
    
    // Compute which room types to display based on the environment
    var roomTypes: [String] {
        if environment == "Interior" {
            return interiorRoomTypes
        } else {
            return exteriorSpaceTypes
        }
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(roomTypes, id: \.self) { roomType in
                    Button(action: {
                        selectedRoomType = roomType
                        dismiss()
                    }) {
                        HStack {
                            Text(roomType)
                                .font(Font.custom("Poppins-Regular", size: 16))
                                .foregroundColor(Color("TextColor"))
                            
                            Spacer()
                            
                            if selectedRoomType == roomType {
                                Image(systemName: "checkmark")
                                    .foregroundColor(Color("PrimaryColor"))
                            }
                        }
                    }
                    .padding(.vertical, 8)
                }
            }
            .navigationTitle("Select Room Type")
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
