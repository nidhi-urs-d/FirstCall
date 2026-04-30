import SwiftUI

/// A modern card style applied consistently to lists and grids
struct CardStyle: ViewModifier {
    let padding: CGFloat
    let cornerRadius: CGFloat
    
    init(padding: CGFloat = AppTheme.spacingMD, cornerRadius: CGFloat = AppTheme.radiusMD) {
        self.padding = padding
        self.cornerRadius = cornerRadius
    }
    
    func body(content: Content) -> some View {
        content
            .padding(padding)
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
    }
}

extension View {
    func cardStyle(padding: CGFloat = AppTheme.spacingMD, cornerRadius: CGFloat = AppTheme.radiusMD) -> some View {
        self.modifier(CardStyle(padding: padding, cornerRadius: cornerRadius))
    }
}
