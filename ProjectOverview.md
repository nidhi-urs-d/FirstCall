# FirstCall App - Architecture & Components Overview

This document provides a comprehensive breakdown of all files, structures, libraries, and design elements used in the FirstCall application.

## 1. Apple Frameworks & Native APIs
*   **SwiftUI:** Core declarative UI framework used for all views, layout transitions (`.transition(.asymmetric...)`), and dynamic type accessibility.
*   **AVFoundation:** Used specifically for `AVSpeechSynthesizer` to provide offline, on-device text-to-speech capabilities (found in `VoiceManager.swift`).
*   **UIKit:** Interfaced via `UIImpactFeedbackGenerator` and `UINotificationFeedbackGenerator` for physical haptic feedback (found in `HapticManager.swift`).
*   **Foundation:** Base framework for data types, structured concurrency, and core logic.

## 2. State & Data Management
*   **@AppStorage (UserDefaults):** Used for lightweight, persistent state management (e.g., tracking the `hasSeenOnboarding` boolean).
*   **Observation / Combine (`ObservableObject`, `@Published`):** Used in manager classes (like `VoiceManager`) to publish state changes to the UI reactively.

## 3. Core App Files & Structure

### Root Application Files
*   **`FirstCallApp.swift`**: The main entry point. Manages the initial routing between the Splash Screen, Onboarding Flow, and the main `ContentView`. Utilizes Swift Concurrency for the splash delay.
*   **`ContentView.swift`**: The primary root view of the app after onboarding. Typically hosts navigation and the main category grid.

### Data Models & Logic
*   **`InstructionData.swift`**: A massive data file containing all the structured medical and emergency protocols. 
*   **`Instruction.swift`**: The Swift `struct` definitions mapping the data (Categories, Scenarios, Steps).
*   **`Managers/VoiceManager.swift`**: A singleton class managing the `AVSpeechSynthesizer`. Uses `@MainActor` for thread safety.
*   **`Managers/HapticManager.swift`**: A utility struct providing standardized haptic feedback presets (e.g., `tap()`, `sos()`, `success()`).

### UI Components (Reusable)
*   **`Components/CategoryCard.swift`**: The visual card representing a high-level emergency category (e.g., "Medical", "Accidents").
*   **`Components/StepCard.swift`**: The UI component displaying individual instruction steps.
*   **`EmergencyCallButton.swift`**: A prominent, accessible button designed for high-stress situations.
*   **`EmergencyRowView.swift`**: A standardized list row for displaying sub-categories or specific emergencies.

### Main Views (Screens)
*   **`CategoryGridView.swift`**: Displays the main grid of emergency categories.
*   **`EmergencyListView.swift`**: Displays the list of specific scenarios within a selected category.
*   **`EmergencyDetailView.swift`**: The core action screen displaying step-by-step instructions.
*   **`SearchView.swift`**: The search interface for quickly finding specific emergencies.
*   **`Onboarding/SplashView.swift`**: The initial branding screen.
*   **`Onboarding/GetStartedView.swift`**: The final onboarding screen explaining core features before entering the app.

### Styling & Theme
*   **`Theme/AppColors.swift`**: Defines the semantic color palette extending the native `Color` struct, ensuring WCAG AA contrast compliance and dark-mode readiness.
*   **`Extensions/ViewModifiers.swift`**: Contains custom modifiers like `CardStyle` to ensure consistent padding, corner radii, and backgrounds across the app.
*   **`Assets.xcassets/Contents.json`**: Manages adaptive assets, specifically defining the `AccentColor` for interactive elements across Light and Dark modes.
*   **SF Symbols**: Apple's native vector iconography system used extensively for highly accessible, scalable icons.

## 4. Modern Swift Features Utilized
*   **Swift Concurrency (`async`/`await`):** Used for non-blocking operations, such as the splash screen timer.
*   **MainActor Isolation:** Ensuring UI updates (like voice state changes) occur on the main thread safely.
*   **Declarative Extensions:** Extensive use of `extension` blocks to organize code cleanly (e.g., separating `AVSpeechSynthesizerDelegate` compliance).
