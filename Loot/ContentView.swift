import SwiftUI

class Inventory: ObservableObject {
    @Published var loot: [LootItem] = [
        LootItem(quantity: 1, name: "Bottes de célérité", type: .boot, rarity: .rare, attackStrength: 0, game: availableGames.first(where: { $0.name == "League of Legends" }) ?? Game.emptyGame),
        LootItem(quantity: 1, name: "Lame de Doran", type: .dagger, rarity: .common, attackStrength: 20, game: availableGames.first(where: { $0.name == "League of Legends" }) ?? Game.emptyGame),
        LootItem(quantity: 1, name: "Cape solaire", type: .shield, rarity: .legendary, attackStrength: 30, game: availableGames.first(where: { $0.name == "League of Legends" }) ?? Game.emptyGame)
    ]
    
    func addItem(item: LootItem) {
        loot.append(item)
    }
}

struct ContentView: View {
    @StateObject var inventory = Inventory()
    @State var showAddItemView = false

    var body: some View {
        NavigationView {
            List {
                Button(action: {
                    let newItem = LootItem(quantity: 1, name: "Magie de feu", type: .boot, rarity: .common, attackStrength: 0, game: availableGames.first(where: { $0.name == "League of Legends" }) ?? Game.emptyGame)
                    inventory.addItem(item: newItem)
                }, label: {
                    Text("Ajouter")
                })
                ForEach(inventory.loot) { item in
                    HStack {
                        Circle()
                            .frame(width: 10, height: 10)
                            .foregroundColor(item.rarity.color)
                        
                        Text(item.name)
                        Text("Quantité: \(item.quantity)")
                        
                        Spacer()
                        Text(item.type.rawValue)
                        
                        
                    }
                        
                        
                    
                }
            }
            .sheet(isPresented: $showAddItemView, content: {
                AddItemView().environmentObject(inventory)
            })
            .navigationBarTitle("👝 Inventaire")
            .toolbar(content: {
                ToolbarItem(placement: ToolbarItemPlacement.automatic) {
                    Button(action: {
                        showAddItemView.toggle()
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                    })
                }
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
