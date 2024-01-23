//
//  LootRow.swift
//  Loot
//
//  Created by Florian PICHON on 23/01/2024.
//

import SwiftUI

struct LootRow: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ExtractedView: View {
    var body: some View {
        ForEach(ContentView.inventory.loot) { item in
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
    }
}


#Preview {
    LootRow()
}
