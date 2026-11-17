import SwiftUI

struct AllSiegesView: View {
    @Bindable var model: AppModel

    var body: some View {
        BCScreenChrome {
            VStack(alignment: .leading, spacing: 16) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 4) {
                        BCEyebrow(text: "Campaign")
                        Text("All Sieges")
                            .font(.system(size: 28, weight: .bold))
                            .foregroundStyle(BCTheme.ink)
                    }
                    Spacer()
                    Button("Leaderboard") { model.showLeaderboard = true }
                        .buttonStyle(BCSecondaryButtonStyle())
                        .frame(width: 140)
                }

                VStack(spacing: 10) {
                    ForEach(model.sieges) { siege in
                        siegeRow(siege)
                    }
                }

                Spacer(minLength: 0)

                HStack {
                    Button("< Home") { model.backToHub() }
                        .font(.system(size: 14, weight: .medium))
                        .foregroundStyle(BCTheme.ink)
                        .buttonStyle(.plain)
                    Spacer()
                    Text("1 of 4 sieges unlocked")
                        .font(.system(size: 13))
                        .foregroundStyle(BCTheme.muted)
                }
            }
            .padding(28)
        }
        .sheet(isPresented: $model.showLeaderboard) {
            LeaderboardSheet(model: model)
                .presentationDetents([.medium, .large])
        }
    }

    private func siegeRow(_ siege: SiegeSummary) -> some View {
        HStack(spacing: 14) {
            Text(String(format: "%02d", siege.index))
                .font(.system(size: 13, weight: .bold))
                .foregroundStyle(siege.unlocked ? BCTheme.accent : BCTheme.muted)
                .frame(width: 34, height: 34)
                .background(siege.unlocked ? BCTheme.accentSoft : BCTheme.lockedFill)
                .clipShape(Circle())

            VStack(alignment: .leading, spacing: 3) {
                Text(siege.name)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(siege.unlocked ? BCTheme.ink : BCTheme.muted)
                if siege.unlocked, let best = siege.bestScore {
                    Text("Unlocked · Best \(best.formatted())")
                        .font(.system(size: 13))
                        .foregroundStyle(BCTheme.muted)
                } else if let hint = siege.lockHint {
                    Text(hint)
                        .font(.system(size: 13))
                        .foregroundStyle(BCTheme.muted)
                }
            }

            Spacer()

            if siege.unlocked {
                BCStarRow(filled: siege.stars)
                Button("Play") { model.startSiege() }
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundStyle(BCTheme.accent)
                    .padding(.horizontal, 14)
                    .padding(.vertical, 8)
                    .background(BCTheme.accentSoft)
                    .clipShape(Capsule())
                    .buttonStyle(.plain)
            } else {
                Text("Locked")
                    .font(.system(size: 13, weight: .medium))
                    .foregroundStyle(BCTheme.muted)
            }
        }
        .padding(14)
        .background(BCTheme.card)
        .clipShape(RoundedRectangle(cornerRadius: BCTheme.cardRadius, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: BCTheme.cardRadius, style: .continuous)
                .stroke(siege.unlocked ? BCTheme.accent : BCTheme.hairline, lineWidth: siege.unlocked ? 1.5 : 1)
        )
        .opacity(siege.unlocked ? 1 : 0.72)
    }
}
