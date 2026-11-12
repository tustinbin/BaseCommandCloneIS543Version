import SwiftUI

struct AccessView: View {
    @Bindable var model: AppModel

    var body: some View {
        BCScreenChrome {
            HStack(spacing: 28) {
                brandPanel
                signInCard
            }
            .padding(28)
        }
    }

    private var brandPanel: some View {
        VStack(alignment: .leading, spacing: 18) {
            BCEyebrow(text: "Base Command")
            Text("A little strategy.\nA lasting victory.")
                .font(.system(size: 34, weight: .bold))
                .foregroundStyle(BCTheme.ink)
                .fixedSize(horizontal: false, vertical: true)
            Text("Build your deck. Hold the center.")
                .font(.system(size: 15))
                .foregroundStyle(BCTheme.muted)

            Spacer(minLength: 12)

            GeometricMark(size: 180)
                .frame(maxWidth: .infinity)

            Text("PLAN / DEPLOY / DEFEND")
                .font(.system(size: 11, weight: .semibold))
                .tracking(1.4)
                .foregroundStyle(BCTheme.muted)
                .frame(maxWidth: .infinity)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
    }

    private var signInCard: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Welcome, Commander")
                .font(.system(size: 26, weight: .bold))
                .foregroundStyle(BCTheme.ink)
            Text("Sign in to continue your campaign.")
                .font(.system(size: 14))
                .foregroundStyle(BCTheme.muted)

            VStack(spacing: 10) {
                BCTextField(placeholder: "Email address", text: $model.email)
                BCTextField(placeholder: "Password", text: $model.password, isSecure: true)
                BCTextField(placeholder: "Commander name", text: $model.commanderName)
            }
            .padding(.top, 4)

            Button("Sign In") { model.signIn() }
                .buttonStyle(BCPrimaryButtonStyle())

            Button("Create Account") { model.signIn() }
                .buttonStyle(BCSecondaryButtonStyle())
        }
        .padding(24)
        .frame(width: 340)
        .background(BCTheme.card)
        .clipShape(RoundedRectangle(cornerRadius: BCTheme.cardRadius, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: BCTheme.cardRadius, style: .continuous)
                .stroke(BCTheme.hairline, lineWidth: 1)
        )
        .shadow(color: .black.opacity(0.04), radius: 18, y: 8)
    }
}
