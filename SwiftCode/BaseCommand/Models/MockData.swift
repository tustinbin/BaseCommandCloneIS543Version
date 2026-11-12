import Foundation
import SwiftUI

enum HubTab: Int, CaseIterable, Identifiable {
    case shop, home, decks

    var id: Int { rawValue }

    var title: String {
        switch self {
        case .shop: "Shop"
        case .home: "Home"
        case .decks: "Decks"
        }
    }
}

enum AppRoute: Equatable {
    case access
    case hub
    case allSieges
    case battlefield
    case results
}

struct ShopItem: Identifiable, Hashable {
    let id: String
    let name: String
    let blurb: String
    let cost: Int
    var owned: Bool
}

struct DeckSummary: Identifiable, Hashable {
    enum Status: String {
        case active = "Active"
        case ready = "Ready"
        case draft = "Draft"
    }

    let id: String
    var name: String
    var cardCount: Int
    var status: Status

    var subtitle: String {
        switch status {
        case .active, .ready:
            return "\(cardCount)/24 cards · Ready to deploy"
        case .draft:
            return "\(cardCount)/24 cards · Draft"
        }
    }
}

struct SiegeSummary: Identifiable, Hashable {
    let id: String
    let index: Int
    let name: String
    let unlocked: Bool
    let bestScore: Int?
    let stars: Int
    let lockHint: String?
}

struct LeaderboardRow: Identifiable, Hashable {
    let id: String
    let rank: Int
    let commander: String
    let score: Int
    let stars: Int
    var isYou: Bool = false
}

@Observable
final class AppModel {
    var route: AppRoute = .access
    var hubTab: HubTab = .home

    var email = ""
    var password = ""
    var commanderName = "Alex Morgan"
    var credits = 2450

    var showLeaderboard = false
    var selectedShopID = "range"

    var shopItems: [ShopItem] = [
        .init(id: "sentinel", name: "Sentinel", blurb: "Hold the inner ring. Absorb the first strike.", cost: 200, owned: true),
        .init(id: "pulse", name: "Pulse", blurb: "Clear a lane with a focused blast.", cost: 220, owned: true),
        .init(id: "barrier", name: "Barrier", blurb: "Raise a shield on a threatened quadrant.", cost: 240, owned: true),
        .init(id: "range", name: "Range", blurb: "Extend your reach. Control the outer ring.", cost: 250, owned: false),
        .init(id: "reserve", name: "Reserve", blurb: "Draw one extra unit next turn.", cost: 300, owned: false),
        .init(id: "overdrive", name: "Overdrive", blurb: "Push the base cannon one charge forward.", cost: 600, owned: false)
    ]

    var decks: [DeckSummary] = [
        .init(id: "d1", name: "Balanced defense", cardCount: 24, status: .active),
        .init(id: "d2", name: "Outer ring", cardCount: 24, status: .ready),
        .init(id: "d3", name: "Fast response", cardCount: 16, status: .draft)
    ]

    var sieges: [SiegeSummary] = [
        .init(id: "s1", index: 1, name: "The First Line", unlocked: true, bestScore: 12450, stars: 3, lockHint: nil),
        .init(id: "s2", index: 2, name: "Crossing Point", unlocked: false, bestScore: nil, stars: 0, lockHint: "Complete Siege 01 to unlock"),
        .init(id: "s3", index: 3, name: "The Outer Ring", unlocked: false, bestScore: nil, stars: 0, lockHint: "Complete Siege 02 to unlock"),
        .init(id: "s4", index: 4, name: "Last Stand", unlocked: false, bestScore: nil, stars: 0, lockHint: "Complete Siege 03 to unlock")
    ]

    var leaderboard: [LeaderboardRow] = [
        .init(id: "l1", rank: 1, commander: "Nova", score: 18920, stars: 3),
        .init(id: "l2", rank: 2, commander: "Alex Morgan", score: 12450, stars: 3, isYou: true),
        .init(id: "l3", rank: 3, commander: "Rowan", score: 11870, stars: 3),
        .init(id: "l4", rank: 4, commander: "Ivy", score: 9800, stars: 2),
        .init(id: "l5", rank: 5, commander: "Kai", score: 7640, stars: 2)
    ]

    var selectedShopItem: ShopItem? {
        shopItems.first { $0.id == selectedShopID }
    }

    var activeDeck: DeckSummary? {
        decks.first { $0.status == .active }
    }

    func signIn() {
        if commanderName.trimmingCharacters(in: .whitespaces).isEmpty {
            commanderName = "Alex Morgan"
        }
        withAnimation(.easeInOut(duration: 0.25)) {
            route = .hub
            hubTab = .home
        }
    }

    func signOut() {
        withAnimation(.easeInOut(duration: 0.25)) {
            route = .access
        }
    }

    func startSiege() {
        withAnimation(.easeInOut(duration: 0.25)) {
            route = .battlefield
        }
    }

    func endTurnVisual() {
        withAnimation(.easeInOut(duration: 0.25)) {
            route = .results
        }
    }

    func continueFromResults() {
        withAnimation(.easeInOut(duration: 0.25)) {
            route = .hub
            hubTab = .home
        }
    }

    func openAllSieges() {
        withAnimation(.easeInOut(duration: 0.25)) {
            route = .allSieges
        }
    }

    func backToHub() {
        withAnimation(.easeInOut(duration: 0.25)) {
            route = .hub
        }
    }
}
