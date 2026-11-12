import SwiftUI

struct BattlefieldView: View {
    @Bindable var model: AppModel

    var body: some View {
        BCScreenChrome {
            VStack(spacing: 14) {
                topBar
                HStack(alignment: .top, spacing: 16) {
                    turnPanel
                    board
                    handPanel
                }
                .frame(maxHeight: .infinity)
            }
            .padding(22)
        }
    }

    private var topBar: some View {
        HStack(spacing: 16) {
            Button { model.backToHub() } label: {
                Image(systemName: "line.3.horizontal")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(BCTheme.ink)
                    .frame(width: 36, height: 36)
                    .background(BCTheme.lockedFill)
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            }
            .buttonStyle(.plain)

            VStack(alignment: .leading, spacing: 2) {
                BCEyebrow(text: "Siege 01")
                Text("The First Line")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundStyle(BCTheme.ink)
            }

            Spacer()

            Text("SCORE 8,400")
                .font(.system(size: 13, weight: .semibold))
                .foregroundStyle(BCTheme.ink)
            BCStarRow(filled: 2, size: 13)

            VStack(alignment: .leading, spacing: 4) {
                Text("BASE HP")
                    .font(.system(size: 10, weight: .semibold))
                    .foregroundStyle(BCTheme.muted)
                GeometryReader { geo in
                    ZStack(alignment: .leading) {
                        Capsule().fill(BCTheme.lockedFill)
                        Capsule()
                            .fill(BCTheme.accent)
                            .frame(width: geo.size.width * 0.6)
                    }
                }
                .frame(width: 120, height: 8)
            }

            BCStatusPill(text: "8 enemies")
        }
    }

    private var turnPanel: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("04")
                .font(.system(size: 44, weight: .bold))
                .foregroundStyle(BCTheme.ink)
            Text("of 12 turns")
                .font(.system(size: 13))
                .foregroundStyle(BCTheme.muted)
            Text("Hold the center. Deploy a unit, then choose a star card.")
                .font(.system(size: 14))
                .foregroundStyle(BCTheme.muted)
                .fixedSize(horizontal: false, vertical: true)
            Spacer(minLength: 0)
        }
        .padding(16)
        .frame(width: 168, alignment: .topLeading)
        .frame(maxHeight: .infinity, alignment: .topLeading)
        .background(BCTheme.card)
        .clipShape(RoundedRectangle(cornerRadius: BCTheme.cardRadius, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: BCTheme.cardRadius, style: .continuous)
                .stroke(BCTheme.hairline, lineWidth: 1)
        )
    }

    private var board: some View {
        ZStack {
            ForEach([1.0, 0.78, 0.56, 0.34], id: \.self) { scale in
                Circle()
                    .stroke(BCTheme.hairline, lineWidth: 1.2)
                    .frame(width: 280 * scale, height: 280 * scale)
            }
            // Quadrant cross
            Rectangle().fill(BCTheme.hairline.opacity(0.7)).frame(width: 1, height: 280)
            Rectangle().fill(BCTheme.hairline.opacity(0.7)).frame(width: 280, height: 1)

            Circle()
                .fill(BCTheme.accentSoft)
                .frame(width: 28, height: 28)
            Circle()
                .stroke(BCTheme.accent, lineWidth: 2)
                .frame(width: 28, height: 28)

            // Schematic pieces (visual only)
            piece(filled: true).offset(x: -70, y: -40)
            piece(filled: true).offset(x: 55, y: -75)
            piece(filled: false).offset(x: 90, y: 20)
            piece(filled: false).offset(x: -95, y: 55)
            piece(filled: true).offset(x: 30, y: 85)
            Circle().fill(BCTheme.accent).frame(width: 7, height: 7).offset(x: -40, y: -95)
            Circle().fill(BCTheme.accent).frame(width: 7, height: 7).offset(x: 110, y: -50)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(BCTheme.card.opacity(0.55))
        .clipShape(RoundedRectangle(cornerRadius: BCTheme.cardRadius, style: .continuous))
    }

    private func piece(filled: Bool) -> some View {
        Circle()
            .fill(filled ? BCTheme.ink : .clear)
            .overlay(Circle().stroke(BCTheme.ink, lineWidth: 1.5))
            .frame(width: 14, height: 14)
    }

    private var handPanel: some View {
        VStack(spacing: 10) {
            HStack {
                Text("UNITS")
                    .font(.system(size: 10, weight: .semibold))
                    .foregroundStyle(BCTheme.muted)
                    .frame(maxWidth: .infinity)
                Text("STAR CARDS")
                    .font(.system(size: 10, weight: .semibold))
                    .foregroundStyle(BCTheme.muted)
                    .frame(maxWidth: .infinity)
            }

            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 8) {
                handCard(title: "Guard", symbol: "circle.circle", selected: true)
                handCard(title: "+1 power", symbol: "star.fill", selected: false)
                handCard(title: "Pulse", symbol: "circle.circle", selected: false)
                handCard(title: "+2 range", symbol: "star.fill", selected: false)
                handCard(title: "Range", symbol: "circle.circle", selected: false)
                handCard(title: "Repair", symbol: "star.fill", selected: false)
            }

            Spacer(minLength: 0)

            Button("End Turn") { model.endTurnVisual() }
                .buttonStyle(BCPrimaryButtonStyle())
        }
        .padding(12)
        .frame(width: 220)
        .background(BCTheme.card)
        .clipShape(RoundedRectangle(cornerRadius: BCTheme.cardRadius, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: BCTheme.cardRadius, style: .continuous)
                .stroke(BCTheme.hairline, lineWidth: 1)
        )
    }

    private func handCard(title: String, symbol: String, selected: Bool) -> some View {
        VStack(spacing: 8) {
            Image(systemName: symbol)
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(BCTheme.accent)
            Text(title)
                .font(.system(size: 12, weight: .medium))
                .foregroundStyle(BCTheme.ink)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 14)
        .background(selected ? BCTheme.accentSoft : BCTheme.lockedFill.opacity(0.45))
        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .stroke(selected ? BCTheme.accent : BCTheme.hairline, lineWidth: selected ? 1.5 : 1)
        )
    }
}
