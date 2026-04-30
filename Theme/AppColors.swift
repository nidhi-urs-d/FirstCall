import SwiftUI

// MARK: - App Color Palette
// Dark-mode-first design system for FirstCall
// All colors tested for WCAG AA contrast compliance

extension Color {
    // MARK: Backgrounds (using system semantic colors — no asset catalog needed)
    static let fcBackground      = Color(.systemBackground)
    static let fcSurface         = Color(.secondarySystemBackground)
    static let fcSurfaceElevated = Color(.tertiarySystemBackground)


    // MARK: Brand
    static let fcRed            = Color(hex: "#FF3B30")  // Emergency Red
    static let fcBlue           = Color(hex: "#007AFF")  // Action Blue
    static let fcGreen          = Color(hex: "#30D158")  // Safe / Do
    static let fcOrange         = Color(hex: "#FF9F0A")  // Warning
    static let fcPurple         = Color(hex: "#BF5AF2")  // Yoga
    static let fcIndigo         = Color(hex: "#5E5CE6")  // Defence
    static let fcTeal           = Color(hex: "#32ADE6")  // Sign
    static let fcBrown          = Color(hex: "#A2845E")  // Tourism

    // MARK: Text
    static let fcTextPrimary    = Color.primary
    static let fcTextSecondary  = Color.secondary
    static let fcTextInverse    = Color.white

    // MARK: Gradient Stops
    static let fcGradientRed    = [Color(hex: "#FF3B30"), Color(hex: "#C0392B")]
    static let fcGradientBlue   = [Color(hex: "#007AFF"), Color(hex: "#0051D5")]
    static let fcGradientDark   = [Color(hex: "#1C1C1E"), Color(hex: "#000000")]
}

// MARK: - Hex Color Init
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3:  (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:  (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:  (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default: (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(.sRGB,
                  red:   Double(r) / 255,
                  green: Double(g) / 255,
                  blue:  Double(b) / 255,
                  opacity: Double(a) / 255)
    }
}

// MARK: - Category Color Mapping
extension EmergencyCategory {
    var gradientColors: [Color] {
        switch name {
        case "Yoga":             return [Color(hex: "#BF5AF2"), Color(hex: "#9B59B6")]
        case "Exercise":         return [Color(hex: "#007AFF"), Color(hex: "#0051D5")]
        case "Medical":          return [Color(hex: "#FF3B30"), Color(hex: "#C0392B")]
        case "Natural Disaster": return [Color(hex: "#FF9F0A"), Color(hex: "#E67E22")]
        case "Accidents":        return [Color(hex: "#FF2D55"), Color(hex: "#C0392B")]
        case "Crime":            return [Color(hex: "#636366"), Color(hex: "#3A3A3C")]
        case "Home":             return [Color(hex: "#30D158"), Color(hex: "#27AE60")]
        case "Tourism":          return [Color(hex: "#A2845E"), Color(hex: "#7D6142")]
        case "Defence":          return [Color(hex: "#5E5CE6"), Color(hex: "#4A4AC4")]
        case "Sign":             return [Color(hex: "#32ADE6"), Color(hex: "#1A8FC0")]
        default:                 return [Color(hex: "#007AFF"), Color(hex: "#0051D5")]
        }
    }
}
