import SwiftUI

struct GenerateTabView: View {
    
    let environments = ["Interior", "Exterior"]
    
    @Namespace private var animationNamespace
    
    @State private var selectedEnvironment = "Interior"
    @State private var prompt = ""
    
    @FocusState private var isFocused: Bool 

    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 0) {
                ForEach(environments, id: \.self) { environment in
                    ZStack {
                        if selectedEnvironment == environment {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color("PrimaryColor"))
                                .matchedGeometryEffect(id: "tab", in: animationNamespace)
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
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
            VStack {
                Text("Transform Your Space")
                    .font(Font.custom("Poppins-Bold", size: 24))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 2.0)
                
                Text("We’ll analyze and redesign your space instantly.")
                    .font(Font.custom("Poppins-Medium", size: 16))
                    .multilineTextAlignment(.center)
                
                Button(action: {
                    // TODO: Upload Image
                }, label: {
                    Label("Upload Image", systemImage: "plus")
                        .font(Font.custom("Poppins-Regular", size: 16))
                        .fontWeight(.medium)
                        .foregroundColor(Color("TextColor"))
                        .frame(maxWidth: 200, minHeight: 50)
                        .background(Color("PrimaryColor"))
                        .cornerRadius(32)
                        .padding()
                })
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 24)
            .padding(.horizontal, 20)
            .background(Color("SecondaryColor").opacity(0.3))
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
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
                // TODO: Upload Image
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

#Preview {
    GenerateTabView()
}
