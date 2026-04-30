import SwiftUI

// MARK: - Animated Splash Screen
// Shown at app launch for ~2 seconds, then transitions to onboarding.
// Uses SwiftUI animations only — no Lottie, no assets needed (0 extra MB).

struct SplashView: View {
    @State private var logoScale: CGFloat = 0.3
    @State private var logoOpacity: Double = 0
    @State private var ringScale: CGFloat = 0.5
    @State private var ringOpacity: Double = 0.6
    @State private var textOpacity: Double = 0
    @State private var taglineOpacity: Double = 0

    var body: some View {
        ZStack {
            // Dark gradient background
            LinearGradient(
                colors: [Color(hex: "#1C1C1E"), Color(hex: "#000000")],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack(spacing: AppTheme.spacingMD) {
                // Pulsing ring + icon
                ZStack {
                    // Outer pulse ring
                    Circle()
                        .stroke(Color.fcRed.opacity(0.25), lineWidth: 2)
                        .frame(width: 160, height: 160)
                        .scaleEffect(ringScale)
                        .opacity(ringOpacity)

                    // Inner pulse ring
                    Circle()
                        .stroke(Color.fcRed.opacity(0.5), lineWidth: 2)
                        .frame(width: 120, height: 120)
                        .scaleEffect(ringScale * 0.85)
                        .opacity(ringOpacity)

                    // Icon background circle
                    Circle()
                        .fill(
                            RadialGradient(
                                colors: [Color(hex: "#FF3B30").opacity(0.2), Color.clear],
                                center: .center,
                                startRadius: 10,
                                endRadius: 55
                            )
                        )
                        .frame(width: 100, height: 100)

                    // Main icon
                    Image(systemName: "phone.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48, height: 48)
                        .foregroundStyle(Color.fcRed)
                        .scaleEffect(logoScale)
                        .opacity(logoOpacity)
                }

                VStack(spacing: AppTheme.spacingSM) {
                    Text("FirstCall")
                        .font(AppFont.displayLarge)
                        .foregroundStyle(.white)
                        .opacity(textOpacity)

                    Text("Your Emergency Companion")
                        .font(AppFont.bodyMedium)
                        .foregroundStyle(.white.opacity(0.6))
                        .opacity(taglineOpacity)
                }
            }
        }
        .onAppear { animateIn() }
    }

    private func animateIn() {
        withAnimation(.spring(response: 0.6, dampingFraction: 0.65).delay(0.1)) {
            logoScale = 1.0
            logoOpacity = 1.0
        }
        withAnimation(.easeOut(duration: 1.2).delay(0.1)) {
            ringScale = 1.3
            ringOpacity = 0.0
        }
        withAnimation(.easeOut(duration: 0.5).delay(0.4)) {
            textOpacity = 1.0
        }
        withAnimation(.easeOut(duration: 0.5).delay(0.65)) {
            taglineOpacity = 1.0
        }
    }
}

#Preview { SplashView() }
