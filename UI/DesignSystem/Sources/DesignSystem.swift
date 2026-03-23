import SwiftUI

// MARK: - Colors
public extension Color {
    static let steamBlue = Color(hex: "#1b2838")
    static let steamAccent = Color(hex: "#66c0f4")
}

// MARK: - Reusable Views
public struct PrimaryButton: View {
    let title: String
    let action: () -> Void

    public init(_ title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            Text(title)
                .bold()
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.steamAccent)
                .foregroundColor(.white)
                .cornerRadius(12)
        }
    }
}

// MARK: - Helpers
private extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let r = Double((int >> 16) & 0xFF) / 255
        let g = Double((int >> 8) & 0xFF) / 255
        let b = Double(int & 0xFF) / 255
        self.init(red: r, green: g, blue: b)
    }
}
