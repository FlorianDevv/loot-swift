//
//  Game.swift
//  Loot
//
//  Created by Florian PICHON on 19/01/2024.
//

import Foundation
enum GameGenre {
    case mmorpg, rpg, looter, fps, tps, strategy, moba, unset
}

struct Game: Identifiable, Hashable {
    let name: String
    let id: UUID = UUID()
    let genre: GameGenre
    let coverName : String?
    
    static var emptyGame = Game(name: "", genre: .unset, coverName: nil)
}

// Hesitez pas mettre vos propres jeux dans la liste
let availableGames = [
    Game(name: "CS:GO", genre: .fps, coverName: "csgo" ),
    Game(name: "League of Legends", genre: .moba, coverName: "league_of_legends"),
    Game(name: "Dofus", genre: .mmorpg, coverName: "dofus"),
    Game(name: "Minecraft", genre: .rpg, coverName: "minecraft"),
    Game(name: "Fortnite", genre: .fps, coverName: "fortnite"),
]
