import SwiftUI

struct GenerateTabView: View {
    let environments = ["Interior", "Exterior"]
    @Namespace private var animationNamespace
    @State private var selectedEnvironment = "Interior"

    var body: some View {
        VStack {
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
            .padding(.horizontal, 30)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)

    }
}

#Preview {
    GenerateTabView()
}
