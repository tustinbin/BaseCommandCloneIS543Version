// xcode: set sdk=iOS

import SwiftUI

struct ResultsView: View {
    @Bindable var model: AppModel

    var body: some View {
        BCScreenChrome {
            ZStack {
                GeometricMark(size: 420, showCardinals: false, fillCenter: false)
                    .opacity(0.35)
                    .offset(x: -180, y: -40)
                GeometricMark(size: 280, showCardinals: false, fillCenter: false)
                    .opacity(0.28)
                    .offset(x: 220, y: 80)

                VStack(spacing: 16) {
                    BCEyebrow(text: "The First Line")
                    Text("Victory")
                        .font(.system(size: 44, weight: .bold))
                        .foregroundStyle(BCTheme.ink)
                    Text("The center holds. Well commanded.")
                        .font(.system(size: 15))
                        .foregroundStyle(BCTheme.muted)
                    BCStarRow(filled: 3, size: 22)
                        .padding(.top, 4)
                    Text("FINAL SCORE: 12,450")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundStyle(BCTheme.ink)
                        .padding(.top, 4)
                    BCStatusPill(text: "+250 credits", emphasized: true)
                    Button("Continue") { model.continueFromResults() }
                        .buttonStyle(BCPrimaryButtonStyle())
                        .frame(width: 220)
                        .padding(.top, 8)
                }
                .padding(36)
                .background(BCTheme.card.opacity(0.96))
                .clipShape(RoundedRectangle(cornerRadius: BCTheme.cardRadius, style: .continuous))
                .overlay(
                    RoundedRectangle(cornerRadius: BCTheme.cardRadius, style: .continuous)
                        .stroke(BCTheme.hairline, lineWidth: 1)
                )
                .shadow(color: .black.opacity(0.05), radius: 24, y: 10)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
