import SwiftUI

struct HomeView: View {
    @Bindable var model: AppModel

    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            header
            Text("Ready for your next siege?")
                .font(.system(size: 28, weight: .bold))
                .foregroundStyle(BCTheme.ink)

            HStack(alignment: .top, spacing: 16) {
                lastSiegeCard
                actionColumn
            }

            Spacer(minLength: 0)
            HubTabBar(tab: $model.hubTab)
        }
        .padding(.horizontal, 28)
        .padding(.vertical, 22)
    }

    private var header: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 4) {
                BCEyebrow(text: "Commander")
                Text(model.commanderName)
                    .font(.system(size: 22, weight: .bold))
                    .foregroundStyle(BCTheme.ink)
            }
            Spacer()
            BCCreditsPill(amount: model.credits)
        }
    }

    private var lastSiegeCard: some View {
        HStack(alignment: .bottom) {
            VStack(alignment: .leading, spacing: 10) {
                BCEyebrow(text: "Last Siege / 01")
                Text("The First Line")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(BCTheme.ink)
                Text("A strong start. A stronger defense.")
                    .font(.system(size: 14))
                    .foregroundStyle(BCTheme.muted)
                BCStarRow(filled: 3, size: 16)
                BCStatusPill(text: "BEST 12,450", emphasized: true)
            }
            Spacer()
            GeometricMark(size: 110, showCardinals: false)
                .padding(.bottom, 4)
        }
        .padding(22)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .background(BCTheme.card)
        .clipShape(RoundedRectangle(cornerRadius: BCTheme.cardRadius, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: BCTheme.cardRadius, style: .continuous)
                .stroke(BCTheme.hairline, lineWidth: 1)
        )
    }

    private var actionColumn: some View {
        VStack(spacing: 10) {
            Button("Start Siege") { model.startSiege() }
                .buttonStyle(BCPrimaryButtonStyle())
            Button("All Sieges") { model.openAllSieges() }
                .buttonStyle(BCSecondaryButtonStyle())
            Button("Leaderboard") { model.showLeaderboard = true }
                .buttonStyle(BCSecondaryButtonStyle())
            if let deck = model.activeDeck {
                BCStatusPill(text: "Active · \(deck.cardCount)/24")
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.top, 4)
            }
            Spacer(minLength: 0)
        }
        .frame(width: 168)
    }
}
