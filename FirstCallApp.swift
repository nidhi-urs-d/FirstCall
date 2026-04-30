


import SwiftUI
import Foundation
@main
struct FirstCallApp: App {
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false
    @State private var showSplash = true

    var body: some Scene {
        WindowGroup {
            if showSplash {
                SplashView()
                    .transition(.opacity)
                    .task {
                        try? await Task.sleep(for: .seconds(2.0))
                        withAnimation(.easeInOut(duration: 0.6)) {
                            showSplash = false
                        }
                    }
            } else if !hasSeenOnboarding {
                OnboardingView()
                    .transition(.asymmetric(
                        insertion: .move(edge: .trailing).combined(with: .opacity),
                        removal: .opacity
                    ))
            } else {
                ContentView()
                    .transition(.asymmetric(
                        insertion: .move(edge: .trailing).combined(with: .opacity),
                        removal: .opacity
                    ))
            }
        }
    }
}
