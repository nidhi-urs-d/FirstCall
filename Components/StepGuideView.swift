import SwiftUI

// MARK: - Interactive Step-by-Step Guide
// The "Distinguished Winner" feature: walks the user through each step one at a time.
// Uses a large full-screen card layout with progress, haptics, and voice narration.
// Accessible from EmergencyDetailView via a "Guide Me" button.

struct StepGuideView: View {
    let emergency: Instruction
    let categoryColor: Color

    @State private var currentStep = 0
    @State private var phase: GuidePhase = .doing
    @State private var isCompleted = false
    @State private var moveForward: Bool = true
    @ObservedObject private var voice = VoiceManager.shared
    @Environment(\.dismiss) private var dismiss

    enum GuidePhase: Equatable {
        case doing, avoiding


        var title: String {
            switch self {
            case .doing:    return "✅ What To Do"
            case .avoiding: return "❌ What To Avoid"
            }
        }
        var color: Color {
            switch self {
            case .doing:    return .fcGreen
            case .avoiding: return .fcRed
            }
        }
    }

    private var steps: [String] {
        switch phase {
        case .doing:    return emergency.doSteps
        case .avoiding: return emergency.dontSteps
        }
    }

    private var totalSteps: Int { steps.count }
    private var progress: Double { totalSteps > 0 ? Double(currentStep + 1) / Double(totalSteps) : 0 }

    var body: some View {
        ZStack {
            // Background
            Color(.systemBackground).ignoresSafeArea()

            if isCompleted {
                CompletionView(emergency: emergency, onDismiss: { dismiss() })
                    .transition(.asymmetric(
                        insertion: .move(edge: .trailing).combined(with: .opacity),
                        removal: .opacity
                    ))
            } else {
                VStack(spacing: 0) {
                    // Top bar
                    GuideTopBar(
                        emergency: emergency,
                        color: categoryColor,
                        onDismiss: { voice.stop(); dismiss() }
                    )

                    // Phase selector
                    PhasePicker(phase: $phase, onChanged: {
                        moveForward = true
                        currentStep = 0
                        voice.stop()
                    })
                    .padding(.horizontal, AppTheme.spacingMD)
                    .padding(.bottom, AppTheme.spacingMD)

                    // Progress bar
                    ProgressBar(progress: progress, color: phase.color)
                        .padding(.horizontal, AppTheme.spacingMD)

                    Text("\(currentStep + 1) of \(totalSteps)")
                        .font(AppFont.captionBold)
                        .foregroundStyle(.secondary)
                        .padding(.top, AppTheme.spacingXS)

                    Spacer()

                    // Step card
                    StepGuideCard(
                        step: steps[currentStep],
                        index: currentStep,
                        phase: phase,
                        color: categoryColor,
                        emergency: emergency
                    )
                    .id("\(phase.title)-\(currentStep)") // Force view transition on step change
                    .transition(.asymmetric(
                        insertion: .move(edge: moveForward ? .trailing : .leading).combined(with: .opacity),
                        removal: .move(edge: moveForward ? .leading : .trailing).combined(with: .opacity)
                    ))
                    .padding(.horizontal, AppTheme.spacingMD)

                    Spacer()

                    // Navigation buttons
                    GuideNavRow(
                        currentStep: currentStep,
                        totalSteps: totalSteps,
                        phase: phase,
                        hasAvoidPhase: !emergency.dontSteps.isEmpty,
                        onPrev: goToPrev,
                        onNext: goToNext,
                        onSpeak: { voice.speak(steps[currentStep]) }
                    )
                    .padding(.horizontal, AppTheme.spacingMD)
                    .padding(.bottom, AppTheme.spacingXXL)
                }
            }
        }
        .preferredColorScheme(nil)
        .navigationBarHidden(true)
        .onDisappear { voice.stop() }
    }

    // MARK: - Navigation
    private func goToNext() {
        HapticManager.tap()
        voice.stop()
        moveForward = true

        withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
            if currentStep < totalSteps - 1 {
                currentStep += 1
            } else if phase == .doing && !emergency.dontSteps.isEmpty {
                phase = .avoiding
                currentStep = 0
            } else {
                isCompleted = true
                HapticManager.success()
            }
        }
    }

    private func goToPrev() {
        HapticManager.tap()
        voice.stop()
        moveForward = false

        withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
            if currentStep > 0 {
                currentStep -= 1
            } else if phase == .avoiding {
                // Cross back to `.doing` phase
                phase = .doing
                currentStep = max(0, emergency.doSteps.count - 1)
            }
        }
    }
}

// MARK: - Top Bar
private struct GuideTopBar: View {
    let emergency: Instruction
    let color: Color
    let onDismiss: () -> Void

    var body: some View {
        HStack {
            Button(action: onDismiss) {
                HStack(spacing: 4) {
                    Image(systemName: "xmark")
                        .font(.system(size: 13, weight: .semibold))
                    Text("Exit Guide")
                        .font(AppFont.labelMedium)
                }
                .foregroundStyle(.secondary)
            }
            .accessibilityLabel("Exit step-by-step guide")

            Spacer()

            HStack(spacing: AppTheme.spacingXS) {
                Image(systemName: emergency.icon)
                    .foregroundStyle(color)
                Text(LocalizedStringKey(emergency.name))
                    .font(AppFont.headline3)
                    .lineLimit(1)
            }

            Spacer()

            // Balance spacer
            Text("Exit Guide")
                .font(AppFont.labelMedium)
                .opacity(0)
        }
        .padding(.horizontal, AppTheme.spacingMD)
        .padding(.vertical, AppTheme.spacingMD)
    }
}

// MARK: - Phase Picker
private struct PhasePicker: View {
    @Binding var phase: StepGuideView.GuidePhase
    let onChanged: () -> Void

    var body: some View {
        HStack(spacing: 0) {
            ForEach([StepGuideView.GuidePhase.doing, .avoiding], id: \.title) { p in
                Button(action: {
                    if phase != p {
                        phase = p
                        onChanged()
                        HapticManager.selection()
                    }
                }) {
                    Text(p.title)
                        .font(AppFont.labelMedium)
                        .foregroundStyle(phase == p ? .white : .secondary)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, AppTheme.spacingSM + 2)
                        .background(phase == p ? p.color : Color.clear)
                        .clipShape(RoundedRectangle(cornerRadius: AppTheme.radiusSM, style: .continuous))
                }
                .accessibilityLabel(p.title + (phase == p ? ", selected" : ""))
            }
        }
        .padding(3)
        .background(Color(.systemGray5))
        .clipShape(RoundedRectangle(cornerRadius: AppTheme.radiusSM + 3, style: .continuous))
        .animation(AppTheme.animationFast, value: phase.title)
    }
}

// MARK: - Progress Bar
private struct ProgressBar: View {
    let progress: Double
    let color: Color

    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                Capsule().fill(Color(.systemGray5))
                Capsule()
                    .fill(color)
                    .frame(width: geo.size.width * progress)
                    .animation(AppTheme.animationFast, value: progress)
            }
        }
        .frame(height: 6)
        .accessibilityValue("\(Int(progress * 100))% complete")
    }
}

// MARK: - Big Step Card
private struct StepGuideCard: View {
    let step: String
    let index: Int
    let phase: StepGuideView.GuidePhase
    let color: Color
    let emergency: Instruction

    var body: some View {
        VStack(spacing: AppTheme.spacingXL) {
            // Large Emergency Icon (Animated) or Custom Image
            iconView()

            // Step text — large, readable
            Text(step)
                .font(AppFont.headline1)
                .foregroundStyle(.primary)
                .multilineTextAlignment(.center)
                .lineSpacing(4)
        }
        .padding(.vertical, AppTheme.spacingXL)
        .padding(.horizontal, AppTheme.spacingLG)
        .background(
            RoundedRectangle(cornerRadius: AppTheme.radiusLG, style: .continuous)
                .fill(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.1), radius: 24, y: 12)
        )
        .accessibilityLabel("Step \(index + 1): \(step)")
    }
    
    @ViewBuilder
    private func iconView() -> some View {
        ZStack(alignment: .bottomTrailing) {
            if let imageName = emergency.imageName, !imageName.isEmpty {
                // Display custom image
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 160, height: 160)
                    .clipShape(RoundedRectangle(cornerRadius: AppTheme.radiusMD, style: .continuous))
                    .shadow(color: phase.color.opacity(0.2), radius: 12, y: 4)
            } else {
                // Fallback to SF Symbol
                Circle()
                    .fill(phase.color.opacity(0.08))
                    .frame(width: 100, height: 100)
                
                Image(systemName: emergency.icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48)
                    .foregroundStyle(phase.color)
            }
            
            // Small phase indicator badge (Do vs Don't)
            Image(systemName: phase == .doing ? "checkmark.circle.fill" : "xmark.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
                .foregroundStyle(.white)
                .background(Circle().fill(phase.color).padding(2))
                .offset(x: 8, y: 8)
        }
    }
}

// MARK: - Nav Row
private struct GuideNavRow: View {
    let currentStep: Int
    let totalSteps: Int
    let phase: StepGuideView.GuidePhase
    let hasAvoidPhase: Bool
    let onPrev: () -> Void
    let onNext: () -> Void
    let onSpeak: () -> Void

    private var isFirst: Bool { currentStep == 0 && phase == .doing }
    private var isLast: Bool  { currentStep == totalSteps - 1 && (phase == .avoiding || !hasAvoidPhase) }

    var body: some View {
        HStack(spacing: AppTheme.spacingMD) {
            // Back
            Button(action: onPrev) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundStyle(isFirst ? Color(.systemGray4) : .primary)
                    .frame(width: 52, height: 52)
                    .background(Color(.systemGray6))
                    .clipShape(Circle())
            }
            .disabled(isFirst)
            .accessibilityLabel("Previous step")

            // Speak
            Button(action: onSpeak) {
                Image(systemName: "speaker.wave.2.fill")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundStyle(Color.fcOrange)
                    .frame(width: 52, height: 52)
                    .background(Color.fcOrange.opacity(0.12))
                    .clipShape(Circle())
            }
            .accessibilityLabel("Speak this step aloud")

            // Next / Finish
            Button(action: onNext) {
                HStack {
                    Text(isLast ? "Done ✓" : "Next")
                        .font(AppFont.headline3)
                    if !isLast {
                        Image(systemName: "chevron.right")
                            .font(.system(size: 14, weight: .semibold))
                    }
                }
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 52)
                .background(isLast ? Color.fcGreen : Color.fcBlue)
                .clipShape(Capsule())
            }
            .buttonStyle(ScaleButtonStyle())
            .accessibilityLabel(isLast ? "Finish guide" : "Next step")
        }
    }
}

// MARK: - Completion Screen
private struct CompletionView: View {
    let emergency: Instruction
    let onDismiss: () -> Void
    @State private var checkScale: CGFloat = 0.3
    @State private var checkOpacity: Double = 0

    var body: some View {
        VStack(spacing: AppTheme.spacingXL) {
            Spacer()

            ZStack {
                Circle()
                    .fill(Color.fcGreen.opacity(0.12))
                    .frame(width: 160, height: 160)
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .foregroundStyle(Color.fcGreen)
                    .scaleEffect(checkScale)
                    .opacity(checkOpacity)
            }

            VStack(spacing: AppTheme.spacingMD) {
                Text("Guide Complete!")
                    .font(AppFont.displayMedium)
                Text("You've reviewed all steps for\n\(emergency.name).")
                    .font(AppFont.bodyLarge)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
            }

            Spacer()

            Button(action: onDismiss) {
                Text("Back to Details")
                    .font(AppFont.headline3)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, AppTheme.spacingMD)
                    .background(Color.fcBlue)
                    .clipShape(RoundedRectangle(cornerRadius: AppTheme.radiusLG, style: .continuous))
            }
            .buttonStyle(ScaleButtonStyle())
            .padding(.horizontal, AppTheme.spacingLG)
            .padding(.bottom, AppTheme.spacingXXL)
        }
        .onAppear {
            withAnimation(.spring(response: 0.5, dampingFraction: 0.65).delay(0.1)) {
                checkScale = 1.0
                checkOpacity = 1.0
            }
            HapticManager.success()
        }
        .accessibilityLabel("Guide complete. You have reviewed all steps for \(emergency.name).")
    }
}
