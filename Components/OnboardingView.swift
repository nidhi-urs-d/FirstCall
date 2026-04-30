import SwiftUI

struct OnboardingView: View {
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false
    @State private var currentTab = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color(.systemBackground).ignoresSafeArea()
            
            TabView(selection: $currentTab) {
                // Page 1: Welcome & Mission
                OnboardingPage(
                    icon: "book.pages.fill",
                    iconColor: Color.fcRed,
                    title: "Welcome to FirstCall",
                    description: "Your pocket emergency guide. Get absolute clarity and step-by-step assistance when seconds matter most.",
                    isLastPage: false,
                    onGetStarted: { currentTab += 1 }
                )
                .tag(0)
                
                // Page 2: Offline First
                OnboardingPage(
                    icon: "network.slash",
                    iconColor: Color.fcGradientBlue.first ?? .blue,
                    title: "100% Offline Reliability",
                    description: "Emergencies don't wait for a signal. All text, images, and voice instructions are built-in, ready to use anywhere.",
                    isLastPage: false,
                    onGetStarted: { currentTab += 1 }
                )
                .tag(1)
                
                // Page 3: Voice Guidance
                OnboardingPage(
                    icon: "waveform",
                    iconColor: Color.fcOrange,
                    title: "Calming Voice Guides",
                    description: "Keep your hands free and your mind focused. Our built-in voice companion will calmly walk you through critical steps.",
                    isLastPage: true,
                    onGetStarted: {
                        HapticManager.success()
                        withAnimation { hasSeenOnboarding = true }
                    }
                )
                .tag(2)
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            
            // Skip Button placed at top-right
            VStack {
                HStack {
                    Spacer()
                    if currentTab < 2 {
                        Button("Skip") {
                            withAnimation { hasSeenOnboarding = true }
                        }
                        .font(AppFont.bodyLarge.weight(.semibold))
                        .foregroundColor(Color.fcRed)
                        .padding()
                    }
                }
                Spacer()
            }
        }
    }
}

// MARK: - Onboarding Page Structure
struct OnboardingPage: View {
    let icon: String
    let iconColor: Color
    let title: String
    let description: String
    let isLastPage: Bool
    let onGetStarted: () -> Void
    
    @State private var appear = false
    
    var body: some View {
        VStack(spacing: AppTheme.spacingLG) {
            Spacer()
            
            // Icon
            ZStack {
                Circle()
                    .fill(iconColor.opacity(0.12))
                    .frame(width: 140, height: 140)
                    .scaleEffect(appear ? 1 : 0.5)
                
                Image(systemName: icon)
                    .font(.system(size: 60, weight: .semibold))
                    .foregroundStyle(iconColor)
                    .scaleEffect(appear ? 1 : 0.1)
            }
            .padding(.bottom, AppTheme.spacingMD)
            
            // Text Content
            VStack(spacing: AppTheme.spacingMD) {
                Text(title)
                    .font(.system(size: 32, weight: .bold, design: .rounded))
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
                    .opacity(appear ? 1 : 0)
                    .offset(y: appear ? 0 : 20)
                
                Text(description)
                    .font(AppFont.bodyLarge)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 32)
                    .lineSpacing(4)
                    .opacity(appear ? 1 : 0)
                    .offset(y: appear ? 0 : 20)
            }
            
            Spacer()
            
            // Action Button
            Button(action: onGetStarted) {
                Text(isLastPage ? "Get Started" : "Continue")
                    .font(AppFont.headline3)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 18)
                    .background(
                        isLastPage ?
                            LinearGradient(colors: [Color.fcRed, Color.fcOrange], startPoint: .leading, endPoint: .trailing)
                            : LinearGradient(colors: [Color.accentColor], startPoint: .leading, endPoint: .trailing)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: AppTheme.radiusLG, style: .continuous))
                    .shadow(color: isLastPage ? Color.fcRed.opacity(0.3) : .clear, radius: 10, y: 5)
            }
            .buttonStyle(ScaleButtonStyle())
            .padding(.horizontal, AppTheme.spacingLG)
            .padding(.bottom, 60) // Space for TabView dots
            .opacity(appear ? 1 : 0)
        }
        .onAppear {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.7).delay(0.1)) {
                appear = true
            }
        }
    }
}

#Preview {
    OnboardingView()
}
