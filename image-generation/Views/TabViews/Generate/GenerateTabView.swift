import SwiftUI

struct GenerateTabView: View {
    
    @State private var selectedEnvironment = "Interior"
    @State private var selectedImage: UIImage?
    @State private var prompt = ""
    
    @FocusState private var isFocused: Bool
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 20) {
                
                EnviromentSelector(selectedEnvironment: $selectedEnvironment)
                
                ImagePicker(selectedImage: $selectedImage)
                
                HStack(spacing: 20) {
                    Button(action: {
                        // TODO: Select Room Type
                    }) {
                        Label("Room Type", systemImage: "house")
                            .font(Font.custom("Poppins-Regular", size: 16))
                            .fontWeight(.medium)
                            .foregroundColor(Color("TextColor"))
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .background(Color("SecondaryColor").opacity(0.3))
                            .cornerRadius(8)
                    }
                    
                    Button(action: {
                        // TODO: Select Room Style
                    }) {
                        Label("Style", systemImage: "paintpalette")
                            .font(Font.custom("Poppins-Regular", size: 16))
                            .fontWeight(.medium)
                            .foregroundColor(Color("TextColor"))
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .background(Color("SecondaryColor").opacity(0.3))
                            .cornerRadius(8)
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
