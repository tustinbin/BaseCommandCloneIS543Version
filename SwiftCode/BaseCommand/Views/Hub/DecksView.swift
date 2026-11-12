import SwiftUI

struct DecksView: View {
    @Bindable var model: AppModel

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(alignment: .center) {
                VStack(alignment: .leading, spacing: 4) {
                    BCEyebrow(text: "Your collection")
                    Text("Decks")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundStyle(BCTheme.ink)
                }
                Spacer()
                Button("New Deck") {}
                    .buttonStyle(BCPrimaryButtonStyle())
                    .frame(width: 128)
            }

            VStack(spacing: 10) {
                ForEach(model.decks) { deck in
                    deckRow(deck)
                }
            }

            Spacer(minLength: 0)
            HubTabBar(tab: $model.hubTab)
        }
        .padding(.horizontal, 28)
        .padding(.vertical, 22)
    }

    private func deckRow(_ deck: DeckSummary) -> some View {
        HStack(spacing: 14) {
            deckIcon
            VStack(alignment: .leading, spacing: 4) {
                Text(deck.name)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(BCTheme.ink)
                Text(deck.subtitle)
                    .font(.system(size: 13))
                    .foregroundStyle(BCTheme.muted)
            }
            Spacer()
            BCStatusPill(text: deck.status.rawValue, emphasized: deck.status == .active)
            Button("Edit") {}
                .buttonStyle(BCUtilityButtonStyle())
            Button("Delete") {}
                .font(.system(size: 13, weight: .medium))
                .foregroundStyle(BCTheme.muted)
                .buttonStyle(.plain)
        }
        .padding(14)
        .background(BCTheme.card)
        .clipShape(RoundedRectangle(cornerRadius: BCTheme.cardRadius, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: BCTheme.cardRadius, style: .continuous)
                .stroke(deck.status == .active ? BCTheme.accent : BCTheme.hairline, lineWidth: deck.status == .active ? 1.5 : 1)
        )
    }

    private var deckIcon: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 6, style: .continuous)
                .fill(BCTheme.accentSoft)
                .frame(width: 28, height: 36)
                .offset(x: -4, y: 2)
            RoundedRectangle(cornerRadius: 6, style: .continuous)
                .fill(BCTheme.accent.opacity(0.85))
                .frame(width: 28, height: 36)
        }
        .frame(width: 40, height: 40)
    }
}
