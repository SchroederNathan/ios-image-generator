import SwiftUI

struct GenerateTabView: View {
    
    @State private var selectedEnvironment = "Interior"
    @State private var selectedImage: UIImage?
    @State private var prompt = ""
    
    @State private var selectedRoomType = "Room Type" // Default room type
    @State private var showingRoomTypePicker = false // Control sheet presentation
    @State private var selectedStyle = "Style" // Default style
    @State private var showingStylePicker = false // For style picker
    
    @FocusState private var isFocused: Bool
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 20) {
                
                EnviromentSelector(selectedEnvironment: $selectedEnvironment)
                
                ImagePicker(selectedImage: $selectedImage)
                
                HStack(spacing: 20) {
                    Button(action: {
                        showingRoomTypePicker = true
                    }) {
                        Label(selectedRoomType, systemImage: "house")
                            .font(Font.custom("Poppins-Regular", size: 16))
                            .fontWeight(.medium)
                            .foregroundColor(Color("TextColor"))
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .background(Color("SecondaryColor").opacity(0.3))
                            .cornerRadius(8)
                    }
                    .sheet(isPresented: $showingRoomTypePicker) {
                        RoomTypeSelector(
                            selectedRoomType: $selectedRoomType,
                            environment: $selectedEnvironment
                        )
                    }
                    
                    Button(action: {
                        showingStylePicker = true
                    }) {
                        Label(selectedStyle, systemImage: "paintpalette")
                            .font(Font.custom("Poppins-Regular", size: 16))
                            .fontWeight(.medium)
                            .foregroundColor(Color("TextColor"))
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .background(Color("SecondaryColor").opacity(0.3))
                            .cornerRadius(8)
                    }
                    .sheet(isPresented: $showingStylePicker) {
                        StyleTypeSelector(selectedStyleType: $selectedStyle)
                    }
                }
                .frame(maxWidth: .infinity)
                
                VStack {
                    Text("Prompt")
                        .font(Font.custom("Poppins-Bold", size: 24))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    TextEditor(text: $prompt)
                        .scrollContentBackground(.hidden)
                        .frame(minHeight: 150)
                        .font(Font.custom("Poppins-Regular", size: 16))
                        .foregroundColor(Color("TextColor"))
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)
                        .background(Color("SecondaryColor").opacity(0.3))
                        .cornerRadius(8)
                        .focused($isFocused) // Bind the TextEditor focus state
                }
                
                Button(action: {
                    // TODO: Generate page
                }, label: {
                    Label("Generate", systemImage: "sparkles")
                        .font(Font.custom("Poppins-Regular", size: 16))
                        .fontWeight(.medium)
                        .foregroundColor(Color("TextColor"))
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .background(Color("PrimaryColor"))
                        .cornerRadius(32)
                })
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
            .gesture(
                TapGesture()
                    .onEnded {
                        isFocused = false // Dismiss the keyboard when tapping outside the focused view
                    }
            )
        }
    }
}

#Preview {
    GenerateTabView()
}
