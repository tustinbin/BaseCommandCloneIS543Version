import SwiftUI

/// Geometric Landscape tokens from the HW8 storyboard.
enum BCTheme {
    static let canvas = Color(hex: 0xE8EAE7)
    static let surface = Color(hex: 0xF7F8F4)
    static let card = Color.white
    static let accent = Color(hex: 0x9A7A3E)
    static let accentSoft = Color(hex: 0xEBE4D8)
    static let ink = Color(hex: 0x1A1A1A)
    static let muted = Color(hex: 0x757575)
    static let hairline = Color(hex: 0xD9D9D4)
    static let lockedFill = Color(hex: 0xF0F0EC)

    static let cardRadius: CGFloat = 16
    static let controlRadius: CGFloat = 12
    static let screenRadius: CGFloat = 28
    static let rhythm: CGFloat = 8
}

extension Color {
    init(hex: UInt32, opacity: Double = 1) {
        let r = Double((hex >> 16) & 0xFF) / 255
        let g = Double((hex >> 8) & 0xFF) / 255
        let b = Double(hex & 0xFF) / 255
        self.init(.sRGB, red: r, green: g, blue: b, opacity: opacity)
    }
}

struct BCPrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 15, weight: .semibold))
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 12)
            .background(BCTheme.accent.opacity(configuration.isPressed ? 0.85 : 1))
            .clipShape(RoundedRectangle(cornerRadius: BCTheme.controlRadius, style: .continuous))
    }
}

struct BCSecondaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 15, weight: .semibold))
            .foregroundStyle(BCTheme.ink)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 12)
            .background(BCTheme.card.opacity(configuration.isPressed ? 0.7 : 1))
            .overlay(
                RoundedRectangle(cornerRadius: BCTheme.controlRadius, style: .continuous)
                    .stroke(BCTheme.hairline, lineWidth: 1)
            )
            .clipShape(RoundedRectangle(cornerRadius: BCTheme.controlRadius, style: .continuous))
    }
}

struct BCUtilityButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 13, weight: .medium))
            .foregroundStyle(BCTheme.ink)
            .padding(.horizontal, 14)
            .padding(.vertical, 8)
            .background(BCTheme.lockedFill.opacity(configuration.isPressed ? 0.7 : 1))
            .clipShape(RoundedRectangle(cornerRadius: BCTheme.controlRadius, style: .continuous))
    }
}
