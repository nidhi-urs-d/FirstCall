
// MARK: - Redesigned Category Grid View
// Full-width gradient cards in a 2-column adaptive grid.
// Floating SOS button + Search navigation in the toolbar.
import SwiftUI
import Foundation
struct CategoryGridView: View {
    let columns = [GridItem(.flexible(), spacing: AppTheme.spacingMD),
                   GridItem(.flexible(), spacing: AppTheme.spacingMD)]
    @State private var appeared = false
    @State private var showSearch = false

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                VStack(alignment: .leading, spacing: AppTheme.spacingMD) {

                    // Hero header
                    HeroHeader()
                        .padding(.horizontal, AppTheme.spacingMD)
                        .padding(.top, AppTheme.spacingSM)

                    // Category grid
                    LazyVGrid(columns: columns, spacing: AppTheme.spacingMD) {
                        ForEach(Array(InstructionData.allCategories.enumerated()), id: \.element.id) { index, category in
                            NavigationLink(destination:
                                EmergencyListView(category: category)
                                    .environment(\.categoryColor, category.gradientColors.first ?? .fcBlue)
                            ) {
                                CategoryCard(category: category)
                            }
                            .buttonStyle(.plain)
                            .opacity(appeared ? 1 : 0)
                            .offset(y: appeared ? 0 : 20)
                            .animation(AppTheme.animationFast.delay(Double(index) * 0.04), value: appeared)
                            .simultaneousGesture(TapGesture().onEnded { HapticManager.tap() })
                        }
                    }
                    .padding(.horizontal, AppTheme.spacingMD)
                    .padding(.bottom, 100) // space for SOS button
                }
            }
            .background(Color(.systemBackground))
            .navigationTitle("FirstCall")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showSearch = true }) {
                        Image(systemName: "magnifyingglass")
                            .fontWeight(.semibold)
                            .foregroundStyle(Color.fcRed)
                    }
                    .accessibilityLabel("Search emergencies")
                }
            }
            .onAppear {
                withAnimation(AppTheme.animationMedium) { appeared = true }
            }

        }
        .sheet(isPresented: $showSearch) {
            SearchView()
        }
    }
}

// MARK: - Hero Header
private struct HeroHeader: View {
    var body: some View {
        VStack(alignment: .leading, spacing: AppTheme.spacingXS) {
            Text("Emergency Guide")
                .font(AppFont.headline2)
                .foregroundStyle(.secondary)
            Text("What do you need?")
                .font(AppFont.displayMedium)
                .foregroundStyle(.primary)
        }
    }
}
