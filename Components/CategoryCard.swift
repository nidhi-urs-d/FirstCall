import SwiftUI

// MARK: - Category Card Component
// Full-bleed gradient card for the category grid.
// Scales on press with spring animation.

struct CategoryCard: View {
    let category: EmergencyCategory
    @State private var isPressed = false
    @State private var isAnimating = false

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            // Gradient background
            RoundedRectangle(cornerRadius: AppTheme.radiusLG, style: .continuous)
                .fill(
                    LinearGradient(
                        colors: category.gradientColors,
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )

            // Decorative circle (top-right glow)
            Circle()
                .fill(.white.opacity(isAnimating ? 0.12 : 0.05))
                .frame(width: 90, height: 90)
                .scaleEffect(isAnimating ? 1.15 : 0.85)
                .offset(x: 30, y: -30)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                .clipped()

            // Content
            VStack(alignment: .leading, spacing: AppTheme.spacingXS) {
                Image(systemName: category.icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: AppTheme.iconMD, height: AppTheme.iconMD)
                    .foregroundStyle(.white)
                    .offset(y: isAnimating ? -4 : 4)

                Spacer()

                Text(LocalizedStringKey(category.name))
                    .font(AppFont.labelLarge)
                    .foregroundStyle(.white)
                    .lineLimit(2)
                    .minimumScaleFactor(0.85)

                Text("\(category.emergencies.count) items")
                    .font(AppFont.caption)
                    .foregroundStyle(.white.opacity(0.7))
            }
            .padding(AppTheme.spacingMD)
        }
        .frame(height: 140)
        .scaleEffect(isPressed ? 0.95 : 1.0)
        .shadow(
            color: category.gradientColors.first?.opacity(0.35) ?? .clear,
            radius: 10,
            x: 0,
            y: 6
        )
        .onLongPressGesture(minimumDuration: .infinity,
                            pressing: { pressing in
            withAnimation(AppTheme.animationFast) { isPressed = pressing }
        }, perform: {})
        .onAppear {
            withAnimation(
                .easeInOut(duration: .random(in: 2.0...3.0))
                .repeatForever(autoreverses: true)
            ) {
                isAnimating = true
            }
        }
        .accessibilityLabel("\(category.name), \(category.emergencies.count) emergencies")
        .accessibilityAddTraits(.isButton)
    }
}
