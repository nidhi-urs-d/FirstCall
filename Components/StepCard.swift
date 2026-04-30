import SwiftUI

// MARK: - Step Card Component
// Displays a numbered do/don't step with icon and styled background.

struct StepCard: View {
    let step: String
    let index: Int
    let type: StepType
    @State private var appeared = false
    @State private var isAnimatingIcon = false

    enum StepType {
        case doStep, dontStep, benefit

        var color: Color {
            switch self {
            case .doStep:   return .fcGreen
            case .dontStep: return .fcRed
            case .benefit:  return .fcBlue
            }
        }

        var icon: String {
            switch self {
            case .doStep:   return "checkmark.circle.fill"
            case .dontStep: return "xmark.circle.fill"
            case .benefit:  return "star.fill"
            }
        }

        var bgOpacity: Double { 0.08 }
    }

    var body: some View {
        HStack(alignment: .top, spacing: AppTheme.spacingMD) {
            // Step indicator
            ZStack {
                Circle()
                    .fill(type.color.opacity(0.15))
                    .frame(width: 36, height: 36)

                Image(systemName: type.icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
                    .foregroundStyle(type.color)
                    .scaleEffect(isAnimatingIcon ? 1.15 : 0.9)
            }
            .accessibilityHidden(true)

            Text(step)
                .font(AppFont.bodyMedium)
                .foregroundStyle(.primary)
                .fixedSize(horizontal: false, vertical: true)
                .lineSpacing(3)

            Spacer(minLength: 0)
        }
        .padding(.horizontal, AppTheme.spacingMD)
        .padding(.vertical, AppTheme.spacingSM + 4)
        .background(type.color.opacity(type.bgOpacity))
        .clipShape(RoundedRectangle(cornerRadius: AppTheme.radiusSM + 2, style: .continuous))
        .opacity(appeared ? 1 : 0)
        .offset(y: appeared ? 0 : 12)
        .onAppear {
            withAnimation(AppTheme.animationFast.delay(Double(index) * 0.05)) {
                appeared = true
            }
            withAnimation(
                .easeInOut(duration: .random(in: 1.5...2.5))
                .repeatForever(autoreverses: true)
                .delay(Double(index) * 0.1)
            ) {
                isAnimatingIcon = true
            }
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel(step)
    }
}

// MARK: - Section Header Card
struct SectionHeaderCard: View {
    let title: String
    let icon: String
    let color: Color

    var body: some View {
        HStack(spacing: AppTheme.spacingSM) {
            Image(systemName: icon)
                .foregroundStyle(color)
                .font(.system(size: 15, weight: .semibold))
                .accessibilityHidden(true)

            Text(title)
                .font(AppFont.headline3)
                .foregroundStyle(color)
        }
        .padding(.top, AppTheme.spacingMD)
        .padding(.bottom, AppTheme.spacingXS)
    }
}
