//
//  Pokemon+Ext.swift
//  Dex3
//
//  Created by Daniel Ezekiel on 11/5/24.
//

import Foundation

extension Pokemon {
    var background: String {
        switch self.types![0] {
        case "normal", "grass", "electric", "poison", "fairy":
            return "normalgrasselectricpoisonfairy"
        case "rock", "ground", "steel", "fighting", "ghost", "dark", "psychic":
            return "rockgroundsteelfightingghostdarkpsychic"
        case "fire", "dragon":
            return "firedragon"
        case "flying", "bug":
            return "flyingbug"
        case "ice":
            return "ice"
        case "water":
            return "water"
        default:
            return "default from Pokemon+Ext.swift"
        }
    }
    
    var stats: [Stat] {
        [
            Stat(id: 1, lable: "HP", value: self.hp),
            Stat(id: 2, lable: "Attack", value: self.attack),
            Stat(id: 3, lable: "Defense", value: self.defense),
            Stat(id: 4, lable: "Special Attack", value: self.specialAttack),
            Stat(id: 5, lable: "Special Defense", value: self.specialDefense),
            Stat(id: 6, lable: "Speed", value: self.speed)
        ]
    }
    
    var highestStat: Stat {
        stats.max { $0.value < $1.value }!
    }
}

struct Stat: Identifiable {
    let id: Int
    let lable: String
    let value: Int16
}
