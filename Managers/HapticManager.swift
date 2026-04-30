import Foundation
import UIKit

// MARK: - Haptic Feedback Manager
// Centralised haptic engine for FirstCall.
// All user interactions that matter use haptics — critical for emergency UX.

@MainActor
struct HapticManager {

    // MARK: Impact Feedback
    static func impact(_ style: UIImpactFeedbackGenerator.FeedbackStyle = .medium) {
        let gen = UIImpactFeedbackGenerator(style: style)
        gen.prepare()
        gen.impactOccurred()
    }

    // MARK: Notification Feedback
    static func notification(_ type: UINotificationFeedbackGenerator.FeedbackType) {
        let gen = UINotificationFeedbackGenerator()
        gen.prepare()
        gen.notificationOccurred(type)
    }

    // MARK: Selection Feedback
    static func selection() {
        let gen = UISelectionFeedbackGenerator()
        gen.prepare()
        gen.selectionChanged()
    }

    // MARK: - Convenience Presets

    /// Light tap — for category/item selection
    static func tap() {
        impact(.light)
    }

    /// Medium impact — for Call or action buttons
    static func callTapped() {
        impact(.medium)
    }

    /// Heavy thud — for SOS button
    static func sos() {
        impact(.heavy)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
            impact(.heavy)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.30) {
            impact(.heavy)
        }
    }

    /// Success — for listen/voice started
    static func success() {
        notification(.success)
    }

    /// Warning — for critical warning screens
    static func warning() {
        notification(.warning)
    }
}
