import SwiftUI

struct TabBarButton: View {
    var icon: String          // Default icon
    var selectedIcon: String? // Optional filled icon
    var title: String
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(spacing: 4) {
                Image(systemName: isSelected ? (selectedIcon ?? icon) : icon)
                    .font(.system(size: 20))
                Text(title)
                    .font(Font.custom("Poppins-Medium", size: 12))
            }
            .foregroundColor(isSelected ? Color("PrimaryColor") : Color("SecondaryColor"))
        }
    }
}
