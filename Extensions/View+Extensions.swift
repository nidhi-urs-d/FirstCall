import SwiftUI

// MARK: - View Extensions for FirstCall Design System

extension View {

    // MARK: Card Style
    func fcCard(cornerRadius: CGFloat = AppTheme.radiusMD, padding: CGFloat = AppTheme.spacingMD) -> some View {
        self
            .padding(padding)
            .background(Color(.systemGray6).opacity(0.8))
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
            .shadow(
                color: AppTheme.shadowLight.color,
                radius: AppTheme.shadowLight.radius,
                x: AppTheme.shadowLight.x,
                y: AppTheme.shadowLight.y
            )
    }

    // MARK: Section Header
    func fcSectionHeader() -> some View {
        self
            .font(AppFont.headline3)
            .foregroundStyle(.secondary)
            .textCase(.uppercase)
            .tracking(0.5)
    }

    // MARK: Gradient Background
    func fcGradientBackground(_ colors: [Color]) -> some View {
        self.background(
            LinearGradient(
                colors: colors,
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
    }

    // MARK: Press Animation
    func fcPressEffect(scale: CGFloat = 0.96) -> some View {
        self.buttonStyle(ScaleButtonStyle(scaleAmount: scale))
    }

    // MARK: Shimmer Placeholder
    func shimmer(isActive: Bool = true) -> some View {
        self.opacity(isActive ? 0.6 : 1.0)
            .animation(.easeInOut(duration: 0.9).repeatForever(autoreverses: true), value: isActive)
    }

    // MARK: Accessibility Helper
    func fcAccessible(label: String, hint: String? = nil, traits: AccessibilityTraits = .isButton) -> some View {
        self
            .accessibilityLabel(label)
            .accessibilityHint(hint ?? "")
            .accessibilityAddTraits(traits)
    }

    // MARK: Conditional Modifier
    @ViewBuilder
    func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
