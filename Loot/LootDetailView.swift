//
//  LootDetailView.swift
//  Loot
//
//  Created by Florian PICHON on 23/01/2024.
//
import SwiftUI
import UIKit

struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
}
struct LootDetailView: View {
    @StateObject var inventory = Inventory()
    @State private var isAnimating = false
    @State private var isImageTapped = false
    @State private var isUniqueAnimating = false
    @State var showAddItemView = false
    let item: LootItem
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Text(item.type.rawValue)
                        .font(.system(size: 60))
                        .frame(width: 100, height: 100)
                        .scaleEffect(isImageTapped ? 1.5 : 1.0)
                        .onTapGesture {
                            withAnimation(.spring()) {
                                self.isImageTapped.toggle()
                            }
                        }
                }
                .padding()
                .background(Color(item.rarity.color).opacity(1))
                .cornerRadius(30)
                .scaleEffect(isAnimating ? 1.0 : 0.1)
                .rotation3DEffect(
                    .init(degrees: isAnimating ? 360 : 0),
                    axis: (x: isAnimating ? 1 : 0, y: isAnimating ? 0.5 : 0, z: 0)
                )
                .shadow(color: Color(item.rarity.color), radius: isAnimating ? 100 : 0)
                .onAppear {
                    withAnimation(.spring()) {
                        self.isAnimating = true
                    }
                }
                .padding()
                
                Text(item.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(Color(item.rarity.color).opacity(1))
                
                if item.quantity == 1 {
                    HStack {
                        Text("Item Unique 🏆")
                            .foregroundStyle(Color.white)
                            .font(.headline)
                            .padding()
                    }
                    .background(Color(item.rarity.color).opacity(1))
                    .shadow(color: Color(item.rarity.color).opacity(1.0), radius: 6)
                    .cornerRadius(10)
                    .frame(width: 200)
                    .padding()
                    .scaleEffect(isUniqueAnimating ? 1.0 : 0.1)
                    .onAppear {
                        withAnimation(.spring()) {
                            self.isUniqueAnimating = true
                        }
                    }
                }
            }
        }

                List {
                                    Section(header: Text("Informations")) {
                                        HStack {
                                            if let coverName = item.game.coverName, !coverName.isEmpty {
                                                Image(coverName)
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(height: 58)
                                                    .cornerRadius(4)
                                                    .scaleEffect(isImageTapped ? 1.5 : 1.0)
                                                    .onTapGesture {
                                                        withAnimation(.spring()) {
                                                            self.isImageTapped.toggle()
                                                        }
                                                    }
                                            } else {
                                                Image(systemName: "rectangle.slash")
                                                    .padding()
                                                    .background(Color.gray.opacity(0.4))
                                                    .cornerRadius(4)
                                                    .frame(height: 58)
                                                    .scaleEffect(isImageTapped ? 1.5 : 1.0)
                                                    .onTapGesture {
                                                        withAnimation(.spring()) {
                                                            self.isImageTapped.toggle()
                                                        }
                                                    }
                                            }
                                            Text("\(item.game.name)")
                                        }
                                
                                
                        
                        
                        Text("In-game : \(item.name)")
                        if item.attackStrength > 0 {
                            Text("Puissance (ATQ): \(item.attackStrength)")
                        }
                        Text("Possédé(s): \(item.quantity)")
                        Text("Rareté: \(item.rarity.rawValue)")
                    }

                    
                        
                }
                .sheet(isPresented: $showAddItemView, content: {
                    AddItemView().environmentObject(inventory)
                })
                .listStyle(InsetGroupedListStyle())
                .toolbar{
                    
                               Button(action: {
                                   showAddItemView.toggle() // L'action de notre bouton
                               }, label: {
                                   Image(systemName: "pencil")
                                   Text("Editer")
                                   
                               })
                           
                }
        
            }
    
        }


#Preview{
    LootDetailView(item: LootItem(quantity: 1, name: "Item Name", type: .unknown, rarity: .legendary, attackStrength: 10, game: Game(name: "Game Name", genre: .rpg, coverName: String())))
}

