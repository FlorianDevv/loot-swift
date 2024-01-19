//
//  LootItem.swift
//  Loot
//
//  Created by Florian PICHON on 19/01/2024.
//

import Foundation

enum ItemType: String, CaseIterable {
    case magic = "⭐️"
    case fire = "🔥"
    case ice = "❄️"
    case wind = "💨"
    case poison = "☠️"
    case thunder = "⚡️"
    case dagger = "🗡️"
    case shield = "🛡️"
    case bow = "🏹"
    case ring = "💍"
    case gun = "🔫"
    case boot = "👞"
    case unknown = "🎲"
}

struct LootItem: Identifiable {
    let id = UUID()
    let quantity: Int
    let name: String
    let type: ItemType
    let rarity: Rarity
    let attackStrength: Int
    let game: Game
}
