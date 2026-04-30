import SwiftUI

// MARK: - Voice Button Component
// Animated speaker button that pulses while speaking.
// Tapping while speaking stops it (toggle behaviour).

struct VoiceButton: View {
    let text: String
    @ObservedObject var voiceManager = VoiceManager.shared
    @State private var pulseScale: CGFloat = 1.0

    var isSpeaking: Bool { voiceManager.isSpeaking }

    var body: some View {
        Button(action: {
            HapticManager.success()
            voiceManager.speak(text)
        }) {
            HStack(spacing: AppTheme.spacingSM) {
                ZStack {
                    // Pulse ring when speaking
                    if isSpeaking {
                        Circle()
                            .stroke(Color.fcOrange.opacity(0.4), lineWidth: 2)
                            .scaleEffect(pulseScale)
                            .opacity(2 - pulseScale)
                            .animation(
                                .easeOut(duration: 0.9).repeatForever(autoreverses: false),
                                value: pulseScale
                            )
                            .onAppear { pulseScale = 1.8 }
                            .onDisappear { pulseScale = 1.0 }
                    }

                    Image(systemName: isSpeaking ? "stop.fill" : "speaker.wave.2.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 18, height: 18)
                        .foregroundStyle(.white)

                }
                .frame(width: 24, height: 24)

                Text(isSpeaking ? "Stop" : "Listen")
                    .font(AppFont.headline3)
                    .foregroundStyle(.white)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, AppTheme.spacingMD)
            .background(
                isSpeaking
                ? Color(hex: "#E67E22")
                : Color.fcOrange
            )
            .clipShape(RoundedRectangle(cornerRadius: AppTheme.radiusMD, style: .continuous))
            .animation(AppTheme.animationFast, value: isSpeaking)
        }
        .buttonStyle(ScaleButtonStyle())
        .accessibilityLabel(isSpeaking ? "Stop reading instructions" : "Listen to emergency instructions")
    }
}
