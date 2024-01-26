import SwiftUI


public class Inventory: ObservableObject {
    @Published var loot: [LootItem] = [
        LootItem(quantity: 1, name: "Bottes de célérité", type: .boot, rarity: .rare, attackStrength: 0, game: availableGames.first(where: { $0.name == "League of Legends" }) ?? Game.emptyGame),
        LootItem(quantity: 1, name: "Lame de Doran", type: .dagger, rarity: .common, attackStrength: 20, game: availableGames.first(where: { $0.name == "League of Legends" }) ?? Game.emptyGame),
        LootItem(quantity: 1, name: "Cape solaire", type: .shield, rarity: .legendary, attackStrength: 30, game: availableGames.first(where: { $0.name == "League of Legends" }) ?? Game.emptyGame)
    ]
    
    func addItem(item: LootItem) {
        loot.append(item)
    }
    func updateItem(item: LootItem) {
        if let index = loot.firstIndex(where: { $0.id == item.id }) {
            loot[index] = item
        }
    }
}

enum LooterFeature {
    case loot
    case wishList
    case profile
}


struct ContentView: View {
    @ObservedObject var inventory = Inventory()
    @State var showAddItemView = false
    var isOnboardingDone: Bool = false
    @State private var selectedFeature: LooterFeature = .loot
    
    var body: some View {
        TabView(selection: $selectedFeature) {
                    LootView()
                        .tabItem {
                            Label("Loot", systemImage: "bag.fill")
                        }
                        .tag(LooterFeature.loot)
                    WishListView()
                        .tabItem {
                            Label("Wishlist", systemImage: "heart.fill")
                        }
                        .tag(LooterFeature.wishList)
                    ProfileView()
                        .tabItem {
                            Label("Profil", systemImage: "person.fill")
                        }
                        .tag(LooterFeature.profile)
                }
    }
    
}



