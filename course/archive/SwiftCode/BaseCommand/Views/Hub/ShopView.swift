import SwiftUI

struct ShopView: View {
    @Bindable var model: AppModel

    private let columns = [
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12)
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 4) {
                    BCEyebrow(text: "Build your advantage")
                    Text("Shop")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundStyle(BCTheme.ink)
                }
                Spacer()
                BCCreditsPill(amount: model.credits)
            }

            HStack(alignment: .top, spacing: 16) {
                LazyVGrid(columns: columns, spacing: 12) {
                    ForEach(model.shopItems) { item in
                        shopTile(item)
                    }
                }
                .frame(maxWidth: .infinity)

                detailPanel
                    .frame(width: 220)
            }

            Spacer(minLength: 0)
            HubTabBar(tab: $model.hubTab)
        }
        .padding(.horizontal, 28)
        .padding(.vertical, 22)
    }

    private func shopTile(_ item: ShopItem) -> some View {
        let selected = model.selectedShopID == item.id
        return Button {
            model.selectedShopID = item.id
        } label: {
            VStack(spacing: 10) {
                ZStack {
                    Circle()
                        .stroke(item.owned ? BCTheme.hairline : BCTheme.muted.opacity(0.35), style: StrokeStyle(lineWidth: 1.2, dash: item.owned ? [] : [4, 3]))
                        .frame(width: 44, height: 44)
                    Circle()
                        .fill(item.owned || selected ? BCTheme.accent : BCTheme.muted.opacity(0.25))
                        .frame(width: 10, height: 10)
                }
                Text(item.name)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundStyle(BCTheme.ink)
                Text(item.owned ? "Owned" : "\(item.cost) credits")
                    .font(.system(size: 12))
                    .foregroundStyle(BCTheme.muted)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(selected ? BCTheme.accentSoft : BCTheme.card)
            .clipShape(RoundedRectangle(cornerRadius: BCTheme.cardRadius, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: BCTheme.cardRadius, style: .continuous)
                    .stroke(
                        selected ? BCTheme.accent : BCTheme.hairline,
                        style: StrokeStyle(lineWidth: selected ? 1.5 : 1, dash: selected && !item.owned ? [5, 4] : [])
                    )
            )
        }
        .buttonStyle(.plain)
    }

    @ViewBuilder
    private var detailPanel: some View {
        if let item = model.selectedShopItem {
            VStack(alignment: .leading, spacing: 12) {
                Text(item.name)
                    .font(.system(size: 22, weight: .bold))
                    .foregroundStyle(BCTheme.ink)
                Text(item.blurb)
                    .font(.system(size: 14))
                    .foregroundStyle(BCTheme.muted)
                    .fixedSize(horizontal: false, vertical: true)
                BCStatusPill(text: "\(item.cost) credits", emphasized: true)
                Spacer(minLength: 0)
                Button(item.owned ? "Owned" : "Unlock") {}
                    .buttonStyle(BCPrimaryButtonStyle())
                    .disabled(item.owned)
                    .opacity(item.owned ? 0.55 : 1)
            }
            .padding(18)
            .frame(maxHeight: .infinity, alignment: .topLeading)
            .background(BCTheme.card)
            .clipShape(RoundedRectangle(cornerRadius: BCTheme.cardRadius, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: BCTheme.cardRadius, style: .continuous)
                    .stroke(BCTheme.hairline, lineWidth: 1)
            )
        }
    }
}
