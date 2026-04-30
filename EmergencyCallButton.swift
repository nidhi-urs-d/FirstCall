
import SwiftUI
import Foundation
struct EmergencyCallButton: View {
    let phoneNumber: String
    let label: String
    @State private var showIPadSheet = false

    var body: some View {
        Button(action: { handleCall() }) {
            HStack(spacing: AppTheme.spacingSM) {
                Image(systemName: "phone.fill")
                    .font(.system(size: 16, weight: .semibold))
                Text(label.isEmpty ? "Call \(phoneNumber)" : label)
                    .font(AppFont.headline3)
            }
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, AppTheme.spacingMD)
            .background(
                LinearGradient(
                    colors: Color.fcGradientRed,
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .clipShape(RoundedRectangle(cornerRadius: AppTheme.radiusMD, style: .continuous))
        }
        .buttonStyle(ScaleButtonStyle())
        .accessibilityLabel("Call emergency number \(phoneNumber)")
        .sheet(isPresented: $showIPadSheet) {
            IPadCallSheet(phoneNumber: phoneNumber)
                .presentationDetents([.height(260)])
                .presentationDragIndicator(.visible)
        }
    }

    private func handleCall() {
        HapticManager.callTapped()
        let urlString = "telprompt://\(phoneNumber)"
        if let url = URL(string: urlString),
           UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        } else {
            // iPad fallback
            showIPadSheet = true
        }
    }
}

// MARK: - iPad Call Sheet
struct IPadCallSheet: View {
    let phoneNumber: String
    @Environment(\.dismiss) private var dismiss
    @State private var copied = false

    var body: some View {
        VStack(spacing: AppTheme.spacingLG) {
            Image(systemName: "phone.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 56, height: 56)
                .foregroundStyle(Color.fcRed)

            Text("Call Emergency Services")
                .font(AppFont.headline2)

            Text(phoneNumber)
                .font(.system(size: 40, weight: .bold, design: .rounded))
                .foregroundStyle(Color.fcRed)

            HStack(spacing: AppTheme.spacingMD) {
                Button(action: {
                    UIPasteboard.general.string = phoneNumber
                    HapticManager.success()
                    withAnimation { copied = true }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation { copied = false }
                    }
                }) {
                    Label(copied ? "Copied!" : "Copy Number", systemImage: copied ? "checkmark" : "doc.on.doc")
                        .font(AppFont.headline3)
                        .foregroundStyle(copied ? Color.fcGreen : Color.primary)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(.systemGray5))
                        .clipShape(RoundedRectangle(cornerRadius: AppTheme.radiusMD, style: .continuous))
                }
                .buttonStyle(ScaleButtonStyle())

                Button("Done") { dismiss() }
                    .font(AppFont.headline3)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.fcBlue)
                    .clipShape(RoundedRectangle(cornerRadius: AppTheme.radiusMD, style: .continuous))
                    .buttonStyle(ScaleButtonStyle())
            }
        }
        .padding(AppTheme.spacingLG)
        .accessibilityLabel("Emergency call sheet. Dial \(phoneNumber) to call emergency services.")
    }
}

extension EmergencyCallButton {
    init(phoneNumber: String) {
        self.init(phoneNumber: phoneNumber, label: "")
    }
}
