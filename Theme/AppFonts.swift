import SwiftUI

// MARK: - Typography System
// Uses SF Pro Rounded for headings (premium feel) and SF Pro for body.
// All fonts support Dynamic Type via .font() scale.

struct AppFont {
    // MARK: Display
    static let displayLarge  = Font.system(.largeTitle, design: .rounded).weight(.bold)
    static let displayMedium = Font.system(.largeTitle, design: .rounded).weight(.bold)

    // MARK: Headline
    static let headline1     = Font.system(.title, design: .rounded).weight(.bold)
    static let headline2     = Font.system(.title2, design: .rounded).weight(.semibold)
    static let headline3     = Font.system(.headline, design: .rounded).weight(.semibold)

    // MARK: Body
    static let bodyLarge     = Font.system(.body, design: .default).weight(.regular)
    static let bodyMedium    = Font.system(.subheadline, design: .default).weight(.regular)
    static let bodySmall     = Font.system(.footnote, design: .default).weight(.regular)

    // MARK: Label
    static let labelLarge    = Font.system(.subheadline, design: .rounded).weight(.semibold)
    static let labelMedium   = Font.system(.footnote, design: .rounded).weight(.semibold)
    static let labelSmall    = Font.system(.caption2, design: .rounded).weight(.medium)

    // MARK: Caption
    static let caption       = Font.system(.caption, design: .default).weight(.regular)
    static let captionBold   = Font.system(.caption, design: .rounded).weight(.semibold)

    // MARK: Step Numbers
    static let stepNumber    = Font.system(.body, design: .monospaced).weight(.bold)
}

// MARK: - Convenience View Modifier
extension View {
    func appFont(_ font: Font) -> some View {
        self.font(font)
    }
}
