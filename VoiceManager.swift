
import SwiftUI
import Foundation
import AVFoundation
@MainActor
final class VoiceManager: NSObject, ObservableObject, AVSpeechSynthesizerDelegate {

    // MARK: - Singleton
    static let shared = VoiceManager()

    // MARK: - State
    @Published var isSpeaking: Bool = false

    // MARK: - Private
    private let synthesizer = AVSpeechSynthesizer()

    private override init() {
        super.init()
        synthesizer.delegate = self
    }

    // MARK: - Speak
    func speak(_ text: String) {
        if synthesizer.isSpeaking {
            synthesizer.stopSpeaking(at: .immediate)
            isSpeaking = false
            return
        }

        let utterance = AVSpeechUtterance(string: text)
        
        // Prefer a soft female voice
        let preferredVoices = AVSpeechSynthesisVoice.speechVoices().filter { $0.language == "en-US" && $0.gender == .female }
        // Try to pick enhanced quality if available, otherwise just use the first female one
        if let enhancedVoice = preferredVoices.first(where: { $0.quality == .enhanced }) {
            utterance.voice = enhancedVoice
        } else if let femaleVoice = preferredVoices.first {
            utterance.voice = femaleVoice
        } else {
            // Fallback
            utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        }
        
        utterance.rate = 0.45 // Slightly slower for a calmer tone
        utterance.pitchMultiplier = 1.1 // Slightly higher pitch for a softer feel
        utterance.volume = 0.9 // Slightly softer volume

        isSpeaking = true
        synthesizer.speak(utterance)
        HapticManager.success()
    }

    func stop() {
        synthesizer.stopSpeaking(at: .word)
        isSpeaking = false
    }

    // MARK: - AVSpeechSynthesizerDelegate
    nonisolated func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        Task { @MainActor in
            self.isSpeaking = false
        }
    }

    nonisolated func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didCancel utterance: AVSpeechUtterance) {
        Task { @MainActor in
            self.isSpeaking = false
        }
    }
}

// MARK: - Static convenience (backwards compat)
extension VoiceManager {
    static func speak(_ text: String) {
        VoiceManager.shared.speak(text)
    }
}
