
// MARK: - Emergency Detail View (Full Redesign)
// Tabbed interface: Do Steps / Don'ts / Benefits
// Animated step cards with staggered entry.
// Action row: Call button (iPad-safe) + Voice button.
import SwiftUI
import Foundation
struct EmergencyDetailView: View {
    let emergency: Instruction
    let categoryColor: Color
    @State private var selectedTab: Int = 0
    @State private var showGuide = false

    var tabs: [String] {
        var t = ["✅ Do", "❌ Don't"]
        if emergency.benefits != nil { t.append("✨ Benefits") }
        return t
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {

                // Hero Icon Banner
                HeroBanner(emergency: emergency, color: categoryColor)

                // Segmented tab selector
                Picker("Section", selection: $selectedTab) {
                    ForEach(tabs.indices, id: \.self) { i in
                        Text(LocalizedStringKey(tabs[i])).tag(i)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal, AppTheme.spacingMD)
                .padding(.vertical, AppTheme.spacingMD)

                // Tab Content
                TabContent(
                    emergency: emergency,
                    selectedTab: selectedTab,
                    color: categoryColor
                )
                .padding(.horizontal, AppTheme.spacingMD)

                // Action Buttons
                ActionRow(emergency: emergency, showGuide: $showGuide)
                    .padding(.horizontal, AppTheme.spacingMD)
                    .padding(.top, AppTheme.spacingLG)
                    .padding(.bottom, AppTheme.spacingXXL)
            }
        }
        .background(Color(.systemBackground))
        .navigationTitle(LocalizedStringKey(emergency.name))
        .navigationBarTitleDisplayMode(.inline)
        .onChange(of: selectedTab) { _ in HapticManager.selection() }
        .navigationDestination(isPresented: $showGuide) {
            StepGuideView(emergency: emergency, categoryColor: categoryColor)
        }
        .onDisappear {
            VoiceManager.shared.stop()
        }
    }
}

// MARK: - Hero Banner
private struct HeroBanner: View {
    let emergency: Instruction
    let color: Color
    @State private var appeared = false

    var body: some View {
        ZStack {
            Rectangle()
                .fill(
                    LinearGradient(
                        colors: [color.opacity(0.18), color.opacity(0.04)],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .frame(height: 160)

            VStack(spacing: AppTheme.spacingMD) {
                Image(systemName: emergency.icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: AppTheme.iconXL, height: AppTheme.iconXL)
                    .foregroundStyle(color)
                    .scaleEffect(appeared ? 1 : 0.5)
                    .opacity(appeared ? 1 : 0)
                    .animation(.spring(response: 0.5, dampingFraction: 0.65), value: appeared)
            }
        }
        .onAppear { appeared = true }
        .accessibilityHidden(true)
    }
}

// MARK: - Tab Content
private struct TabContent: View {
    let emergency: Instruction
    let selectedTab: Int
    let color: Color

    var body: some View {
        VStack(spacing: AppTheme.spacingSM) {
            switch selectedTab {
            case 0:
                ForEach(Array(emergency.doSteps.enumerated()), id: \.offset) { i, step in
                    StepCard(step: step, index: i, type: .doStep)
                }
            case 1:
                ForEach(Array(emergency.dontSteps.enumerated()), id: \.offset) { i, step in
                    StepCard(step: step, index: i, type: .dontStep)
                }
            case 2:
                if let benefits = emergency.benefits {
                    ForEach(Array(benefits.enumerated()), id: \.offset) { i, benefit in
                        StepCard(step: benefit, index: i, type: .benefit)
                    }
                }
            default:
                EmptyView()
            }
        }
    }
}

// MARK: - Action Row
private struct ActionRow: View {
    let emergency: Instruction
    let showGuide: Binding<Bool>

    var body: some View {
        VStack(spacing: AppTheme.spacingMD) {
            Divider()

            // Guide Me Button (flagship feature)
            Button(action: {
                HapticManager.tap()
                showGuide.wrappedValue = true
            }) {
                HStack(spacing: AppTheme.spacingSM) {
                    Image(systemName: "map.fill")
                        .font(.system(size: 15, weight: .semibold))
                    Text("Guide Me Step-by-Step")
                        .font(AppFont.headline3)
                }
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, AppTheme.spacingMD)
                .background(
                    LinearGradient(
                        colors: Color.fcGradientBlue,
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .clipShape(RoundedRectangle(cornerRadius: AppTheme.radiusMD, style: .continuous))
            }
            .buttonStyle(ScaleButtonStyle())
            .accessibilityLabel("Start step-by-step guide for \(emergency.name)")

            HStack(spacing: AppTheme.spacingMD) {
                if let number = emergency.phoneNumber {
                    EmergencyCallButton(phoneNumber: number)
                }
                if emergency.voiceEnabled {
                    VoiceButton(text: emergency.spokenText)
                }
            }
        }
    }
}

