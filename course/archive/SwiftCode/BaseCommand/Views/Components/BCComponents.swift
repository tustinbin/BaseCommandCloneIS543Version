import SwiftUI

struct BCScreenChrome<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(BCTheme.surface)
            .clipShape(RoundedRectangle(cornerRadius: BCTheme.screenRadius, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: BCTheme.screenRadius, style: .continuous)
                    .stroke(BCTheme.hairline.opacity(0.6), lineWidth: 1)
            )
            .padding(12)
            .background(BCTheme.canvas.ignoresSafeArea())
    }
}

struct BCEyebrow: View {
    let text: String

    var body: some View {
        Text(text.uppercased())
            .font(.system(size: 11, weight: .semibold))
            .tracking(1.2)
            .foregroundStyle(BCTheme.muted)
    }
}

struct BCCreditsPill: View {
    let amount: Int

    var body: some View {
        Text("\(amount.formatted()) credits")
            .font(.system(size: 13, weight: .medium))
            .foregroundStyle(BCTheme.accent)
            .padding(.horizontal, 12)
            .padding(.vertical, 7)
            .background(BCTheme.accentSoft)
            .clipShape(Capsule())
    }
}

struct BCStatusPill: View {
    let text: String
    var emphasized = false

    var body: some View {
        Text(text)
            .font(.system(size: 12, weight: .semibold))
            .foregroundStyle(emphasized ? BCTheme.accent : BCTheme.ink.opacity(0.75))
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
            .background(BCTheme.accentSoft)
            .clipShape(Capsule())
    }
}

struct BCStarRow: View {
    let filled: Int
    var total: Int = 3
    var size: CGFloat = 14

    var body: some View {
        HStack(spacing: 4) {
            ForEach(0..<total, id: \.self) { index in
                Image(systemName: index < filled ? "star.fill" : "star")
                    .font(.system(size: size, weight: .semibold))
                    .foregroundStyle(BCTheme.accent)
            }
        }
    }
}

struct BCTextField: View {
    let placeholder: String
    @Binding var text: String
    var isSecure = false

    var body: some View {
        Group {
            if isSecure {
                SecureField(placeholder, text: $text)
            } else {
                TextField(placeholder, text: $text)
            }
        }
        .font(.system(size: 15))
        .foregroundStyle(BCTheme.ink)
        .padding(.horizontal, 14)
        .padding(.vertical, 12)
        .background(BCTheme.lockedFill.opacity(0.55))
        .overlay(
            RoundedRectangle(cornerRadius: BCTheme.controlRadius, style: .continuous)
                .stroke(BCTheme.hairline, lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: BCTheme.controlRadius, style: .continuous))
    }
}

/// Concentric rings mark used across Access / Home / Board.
struct GeometricMark: View {
    var size: CGFloat = 160
    var showCardinals = true
    var fillCenter = true

    var body: some View {
        ZStack {
            ForEach([1.0, 0.72, 0.44], id: \.self) { scale in
                Circle()
                    .stroke(BCTheme.hairline, lineWidth: 1.2)
                    .frame(width: size * scale, height: size * scale)
            }
            if fillCenter {
                Circle()
                    .fill(BCTheme.accentSoft)
                    .frame(width: size * 0.18, height: size * 0.18)
            }
            if showCardinals {
                ForEach(0..<4, id: \.self) { i in
                    Circle()
                        .fill(BCTheme.accent)
                        .frame(width: 7, height: 7)
                        .offset(y: -size * 0.48)
                        .rotationEffect(.degrees(Double(i) * 90))
                }
            }
        }
        .frame(width: size, height: size)
    }
}

struct HubTabBar: View {
    @Binding var tab: HubTab

    var body: some View {
        HStack(spacing: 36) {
            ForEach(HubTab.allCases) { item in
                Button {
                    withAnimation(.easeInOut(duration: 0.2)) { tab = item }
                } label: {
                    VStack(spacing: 6) {
                        Circle()
                            .fill(tab == item ? BCTheme.accent : .clear)
                            .frame(width: 5, height: 5)
                        Text(item.title)
                            .font(.system(size: 14, weight: tab == item ? .semibold : .regular))
                            .foregroundStyle(tab == item ? BCTheme.ink : BCTheme.muted)
                    }
                }
                .buttonStyle(.plain)
            }
        }
        .padding(.top, 4)
        .padding(.bottom, 2)
    }
}
