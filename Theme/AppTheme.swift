import SwiftUI

// MARK: - App Theme Environment Key
// Inject AppTheme into the environment so any child view can access it.

struct AppTheme {
    // Spacing
    static let spacingXS: CGFloat = 4
    static let spacingSM: CGFloat = 8
    static let spacingMD: CGFloat = 16
    static let spacingLG: CGFloat = 24
    static let spacingXL: CGFloat = 32
    static let spacingXXL: CGFloat = 48

    // Corner Radius
    static let radiusSM: CGFloat  = 8
    static let radiusMD: CGFloat  = 14
    static let radiusLG: CGFloat  = 20
    static let radiusXL: CGFloat  = 28
    static let radiusFull: CGFloat = 999

    // Shadow
    static let shadowLight  = (color: Color.black.opacity(0.08), radius: CGFloat(8), x: CGFloat(0), y: CGFloat(4))
    static let shadowMedium = (color: Color.black.opacity(0.15), radius: CGFloat(16), x: CGFloat(0), y: CGFloat(8))
    static let shadowHeavy  = (color: Color.black.opacity(0.25), radius: CGFloat(24), x: CGFloat(0), y: CGFloat(12))

    // Animation
    static let animationFast   = Animation.spring(response: 0.3, dampingFraction: 0.7)
    static let animationMedium = Animation.spring(response: 0.5, dampingFraction: 0.75)
    static let animationSlow   = Animation.easeInOut(duration: 0.6)

    // Icon Sizes
    static let iconSM: CGFloat  = 20
    static let iconMD: CGFloat  = 32
    static let iconLG: CGFloat  = 50
    static let iconXL: CGFloat  = 80
    static let iconXXL: CGFloat = 120
}

// MARK: - Category Color EnvironmentKey
struct CategoryColorKey: EnvironmentKey {
    static let defaultValue: Color = .fcBlue
}

extension EnvironmentValues {
    var categoryColor: Color {
        get { self[CategoryColorKey.self] }
        set { self[CategoryColorKey.self] = newValue }
    }
}

// MARK: - Pressed State Button Style
struct ScaleButtonStyle: ButtonStyle {
    var scaleAmount: CGFloat = 0.95

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? scaleAmount : 1.0)
            .animation(AppTheme.animationFast, value: configuration.isPressed)
    }
}
