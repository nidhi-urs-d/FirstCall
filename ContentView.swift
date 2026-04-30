
// MARK: - Root Content View
// Hosts the NavigationStack that wraps the entire app hierarchy.
import SwiftUI
import Foundation
struct ContentView: View {
    var body: some View {
        NavigationStack {
            CategoryGridView()
        }
    }
}

