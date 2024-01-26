import SwiftUI
enum Rarity: String, CaseIterable {
    case common, uncommon, rare, epic, legendary, unique

    var color: Color {
        switch self {
        case .common:
            return Color.gray
        case .uncommon:
            return Color.green
        case .rare:
            return Color.blue
        case .epic:
            return Color.purple
        case .legendary:
            return Color.orange
        case .unique:
            return Color.red
        }
    }
}




struct AddItemView: View {
    @EnvironmentObject var inventory: Inventory
    @State private var name = ""
    @State private var rarity = Rarity.common
    @State private var selectedGame = Game.emptyGame
    @State private var quantity = 1
    @State private var type = ItemType.unknown
    @State private var attackStrength = 1
    @State private var isAttackItem = false
    @Environment(\.dismiss) private var dismiss
    var itemToEdit: LootItem?
   
        
    
    var body: some View {
        Form {
            Section {
                TextField("Nom de l'objet", text: $name)
                Picker("Rarete", selection: $rarity) {
                    ForEach(Rarity.allCases, id: \.self) { rarity in
                        Text(String(describing: rarity).capitalized)
                    }
                }
            }
            Section {
                Picker("Jeu", selection: $selectedGame) {
                    ForEach(availableGames, id: \.self) { game in
                        Text(game.name).tag(game)
                    }
                }
                        Stepper("Quantité: \(quantity)", value: $quantity)
            }
            
            Section {
                HStack {
    Text("Type")
    Spacer()
    Text(type.rawValue)
       
}
Picker("Type", selection: $type){
    ForEach(ItemType.allCases, id: \.self) { type in
        Text(type.rawValue)
    }
}
.pickerStyle(PalettePickerStyle())
.frame(minWidth: 200)
            }
            
            Section {
    Toggle ("Item d'attaque ?", isOn: $isAttackItem)
    if isAttackItem {
        Stepper("Force d'attaque: \(attackStrength)", value: $attackStrength)
    }
}
            
            Section {
                            Button(action: {
    let newItem = LootItem(quantity: quantity, name: name, type: type, rarity: rarity, attackStrength: attackStrength, game: selectedGame)
    if let itemToEdit = itemToEdit {
        inventory.updateItem(item: newItem)
    } else {
        inventory.addItem(item: newItem)
    }
    dismiss()
}) {
    Text(itemToEdit == nil ? "Ajouter" : "Modifier")
}
                        }
                    }
                    .onAppear {
                        if let itemToEdit = itemToEdit {
                            name = itemToEdit.name
                            rarity = itemToEdit.rarity
                            selectedGame = itemToEdit.game
                            quantity = itemToEdit.quantity
                            type = itemToEdit.type
                            attackStrength = itemToEdit.attackStrength
                            isAttackItem = attackStrength > 0
                        }
                    }
        }
        
    }


struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView().environmentObject(Inventory())
    }
}
