
import SwiftUI
import Foundation
struct SearchView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var query = ""
    @FocusState private var isSearchFocused: Bool

    // Flat list of (emergency, category) pairs for search
    private let allItems: [(Instruction, EmergencyCategory)] = {
        InstructionData.allCategories.flatMap { cat in
            cat.emergencies.map { ($0, cat) }
        }
    }()

    private var results: [(Instruction, EmergencyCategory)] {
        if query.trimmingCharacters(in: .whitespaces).isEmpty {
            return allItems
        }
        let q = query.lowercased()
        return allItems.filter {
            $0.0.name.lowercased().contains(q)
            || $0.1.name.lowercased().contains(q)
            || $0.0.doSteps.joined().lowercased().contains(q)
            || $0.0.dontSteps.joined().lowercased().contains(q)
        }
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // Search bar
                SearchBar(query: $query, isFocused: $isSearchFocused)
                    .padding(.horizontal, AppTheme.spacingMD)
                    .padding(.top, AppTheme.spacingMD)

                if results.isEmpty {
                    EmptySearchView(query: query)
                } else {
                    ScrollView {
                        LazyVStack(spacing: AppTheme.spacingSM) {
                            // Result count
                            HStack {
                                Text("\(results.count) result\(results.count == 1 ? "" : "s")")
                                    .font(AppFont.labelSmall)
                                    .foregroundStyle(.secondary)
                                Spacer()
                            }
                            .padding(.horizontal, AppTheme.spacingMD)
                            .padding(.top, AppTheme.spacingMD)

                            ForEach(results, id: \.0.id) { (emergency, category) in
                                NavigationLink(destination:
                                    EmergencyDetailView(
                                        emergency: emergency,
                                        categoryColor: category.gradientColors.first ?? .fcBlue
                                    )
                                ) {
                                    SearchResultRow(emergency: emergency, category: category)
                                }
                                .buttonStyle(.plain)
                                .padding(.horizontal, AppTheme.spacingMD)
                                .simultaneousGesture(TapGesture().onEnded { HapticManager.tap() })
                            }

                            Spacer(minLength: AppTheme.spacingXXL)
                        }
                    }
                }
            }
            .background(Color(.systemBackground))
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }
                        .font(AppFont.labelLarge)
                }
            }
        }
        .onAppear { isSearchFocused = true }
    }
}

// MARK: - Search Bar
private struct SearchBar: View {
    @Binding var query: String
    var isFocused: FocusState<Bool>.Binding

    var body: some View {
        HStack(spacing: AppTheme.spacingSM) {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(.secondary)
                .accessibilityHidden(true)

            TextField("Search emergencies...", text: $query)
                .font(AppFont.bodyLarge)
                .focused(isFocused)
                .submitLabel(.search)
                .autocorrectionDisabled()
                .accessibilityLabel("Search field")

            if !query.isEmpty {
                Button(action: { query = "" }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(.secondary)
                }
                .accessibilityLabel("Clear search")
            }
        }
        .padding(AppTheme.spacingMD)
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: AppTheme.radiusLG, style: .continuous))
    }
}

// MARK: - Search Result Row
private struct SearchResultRow: View {
    let emergency: Instruction
    let category: EmergencyCategory

    var body: some View {
        HStack(spacing: AppTheme.spacingMD) {
            ZStack {
                RoundedRectangle(cornerRadius: AppTheme.radiusSM, style: .continuous)
                    .fill(
                        LinearGradient(
                            colors: category.gradientColors,
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 40, height: 40)

                Image(systemName: emergency.icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 18, height: 18)
                    .foregroundStyle(.white)
            }

            VStack(alignment: .leading, spacing: 2) {
                Text(LocalizedStringKey(emergency.name))
                    .font(AppFont.headline3)
                    .foregroundStyle(.primary)
                    .lineLimit(1)

                Text(LocalizedStringKey(category.name))
                    .font(AppFont.caption)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            Image(systemName: "chevron.right")
                .font(.system(size: 11, weight: .semibold))
                .foregroundStyle(Color(.tertiaryLabel))
        }
        .padding(AppTheme.spacingMD)
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: AppTheme.radiusMD, style: .continuous))
        .accessibilityLabel("\(emergency.name), \(category.name)")
        .accessibilityAddTraits(.isButton)
    }
}

// MARK: - Empty State
private struct EmptySearchView: View {
    let query: String

    var body: some View {
        VStack(spacing: AppTheme.spacingMD) {
            Spacer()
            Image(systemName: "magnifyingglass")
                .resizable()
                .scaledToFit()
                .frame(width: AppTheme.iconLG, height: AppTheme.iconLG)
                .foregroundStyle(.secondary)

            Text("No results for \"\(query)\"")
                .font(AppFont.headline2)
                .foregroundStyle(.primary)

            Text("Try searching a different term\nor browse categories above.")
                .font(AppFont.bodyMedium)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)

            Spacer()
        }
        .accessibilityLabel("No search results found for \(query)")
    }
}
