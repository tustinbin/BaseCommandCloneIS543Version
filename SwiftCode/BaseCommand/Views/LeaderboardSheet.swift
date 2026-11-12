import SwiftUI

struct LeaderboardSheet: View {
    @Bindable var model: AppModel

    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            VStack(alignment: .leading, spacing: 4) {
                Text("Leaderboard")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(BCTheme.ink)
                Text("The First Line · All-time")
                    .font(.system(size: 14))
                    .foregroundStyle(BCTheme.muted)
            }

            HStack {
                Text("COMMANDER")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("SCORE")
                    .frame(width: 90, alignment: .trailing)
                Text("STARS")
                    .frame(width: 70, alignment: .trailing)
            }
            .font(.system(size: 11, weight: .semibold))
            .foregroundStyle(BCTheme.muted)
            .tracking(0.8)

            VStack(spacing: 6) {
                ForEach(model.leaderboard) { row in
                    HStack {
                        Text(String(format: "%02d  %@", row.rank, row.commander))
                            .font(.system(size: 15, weight: row.isYou ? .semibold : .regular))
                            .foregroundStyle(BCTheme.ink)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text(row.score.formatted())
                            .font(.system(size: 15, weight: .medium))
                            .foregroundStyle(BCTheme.ink)
                            .frame(width: 90, alignment: .trailing)
                        BCStarRow(filled: row.stars, size: 12)
                            .frame(width: 70, alignment: .trailing)
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 10)
                    .background(row.isYou ? BCTheme.accentSoft : .clear)
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                }
            }

            Spacer(minLength: 0)

            Button("Close") { model.showLeaderboard = false }
                .buttonStyle(BCSecondaryButtonStyle())
        }
        .padding(28)
        .background(BCTheme.surface)
    }
}
