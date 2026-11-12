import SwiftUI

struct RootView: View {
    @State private var model = AppModel()

    var body: some View {
        Group {
            switch model.route {
            case .access:
                AccessView(model: model)
            case .hub:
                HubPagerView(model: model)
            case .allSieges:
                AllSiegesView(model: model)
            case .battlefield:
                BattlefieldView(model: model)
            case .results:
                ResultsView(model: model)
            }
        }
        .animation(.easeInOut(duration: 0.22), value: model.route)
    }
}

#Preview("Access") {
    RootView()
}
