import SwiftUI

/// Hub shell: Shop ← Home → Decks (mockup tabs + project_rules swipe).
struct HubPagerView: View {
    @Bindable var model: AppModel

    var body: some View {
        BCScreenChrome {
            TabView(selection: $model.hubTab) {
                ShopView(model: model)
                    .tag(HubTab.shop)
                HomeView(model: model)
                    .tag(HubTab.home)
                DecksView(model: model)
                    .tag(HubTab.decks)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
        }
        .sheet(isPresented: $model.showLeaderboard) {
            LeaderboardSheet(model: model)
                .presentationDetents([.medium, .large])
        }
    }
}
