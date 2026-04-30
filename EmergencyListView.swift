
import SwiftUI
import Foundation
struct EmergencyListView: View {
    let category: EmergencyCategory
    @Environment(\.categoryColor) var categoryColor

    var body: some View {
        ScrollView {
            LazyVStack(spacing: AppTheme.spacingSM) {
                // Category header banner
                CategoryBanner(category: category)
                    .padding(.horizontal, AppTheme.spacingMD)
                    .padding(.top, AppTheme.spacingSM)

                // Emergency rows
                ForEach(category.emergencies) { emergency in
                    NavigationLink(destination:
                        EmergencyDetailView(emergency: emergency, categoryColor: categoryColor)
                    ) {
                        EmergencyRowCard(emergency: emergency, color: categoryColor)
                    }
                    .buttonStyle(.plain)
                    .padding(.horizontal, AppTheme.spacingMD)
                    .simultaneousGesture(TapGesture().onEnded { HapticManager.tap() })
                }

                Spacer(minLength: AppTheme.spacingLG)
            }
        }
        .background(Color(.systemBackground))
        .navigationTitle(LocalizedStringKey(category.name))
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Category Banner
private struct CategoryBanner: View {
    let category: EmergencyCategory

    var body: some View {
        HStack(spacing: AppTheme.spacingMD) {
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: category.gradientColors,
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 56, height: 56)

                Image(systemName: category.icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 26, height: 26)
                    .foregroundStyle(.white)
            }

            VStack(alignment: .leading, spacing: 2) {
                Text(LocalizedStringKey(category.name))
                    .font(AppFont.headline2)
                Text("\(category.emergencies.count) emergencies covered")
                    .font(AppFont.caption)
                    .foregroundStyle(.secondary)
            }

            Spacer()
        }
        .cardStyle(cornerRadius: AppTheme.radiusLG)
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(category.name) category, \(category.emergencies.count) emergencies")
    }
}

// MARK: - Emergency Row Card
struct EmergencyRowCard: View {
    let emergency: Instruction
    let color: Color
    @State private var appeared = false
    
    var body: some View {
        HStack(spacing: AppTheme.spacingMD) {
            // Icon
            ZStack {
                RoundedRectangle(cornerRadius: AppTheme.radiusSM, style: .continuous)
                    .fill(color.opacity(0.12))
                    .frame(width: 44, height: 44)
                
                Image(systemName: emergency.icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 22, height: 22)
                    .foregroundStyle(color)
            }
            
            // Text
            VStack(alignment: .leading, spacing: 2) {
                Text(LocalizedStringKey(emergency.name))
                    .font(AppFont.headline3)
                    .foregroundStyle(.primary)
                    .lineLimit(2)
                
                HStack(spacing: 4) {
                    if emergency.phoneNumber != nil {
                        Label("Dial available", systemImage: "phone.fill")
                            .font(AppFont.caption)
                            .foregroundStyle(Color.fcGreen)
                    }
                    if emergency.voiceEnabled {
                        Label("Voice", systemImage: "speaker.wave.2.fill")
                            .font(AppFont.caption)
                            .foregroundStyle(Color.fcOrange)
                    }
                }
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.system(size: 12, weight: .semibold))
                .foregroundStyle(Color(.tertiaryLabel))
        }
        .cardStyle()
        .accessibilityLabel(emergency.name + (emergency.phoneNumber != nil ? ", emergency dial available" : ""))
        .accessibilityAddTraits(.isButton)
    }
    
}
