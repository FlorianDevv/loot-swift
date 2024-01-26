//
//  LootView.swift
//  Loot
//
//  Created by Florian PICHON on 26/01/2024.
//

import SwiftUI

struct LootView: View {
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
                    NavigationLink(destination: LootDetailView(item: item)) {
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
                .onDelete(perform: delete)
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
    func delete(at offsets: IndexSet) {
        inventory.loot.remove(atOffsets: offsets)
        }
}
