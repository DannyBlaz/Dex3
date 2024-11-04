//
//  PokemonViewModel.swift
//  Dex3
//
//  Created by Daniel Ezekiel on 11/4/24.
//

import Foundation

@MainActor
class PokemonViewModel: ObservableObject {
    enum Status {
        case notStarted
        case fetching
        case success
        case failed(error: Error)
    }
    
    @Published private(set) var status = Status.notStarted
    
    private let controller: FetchController
    
    init (controller: FetchController){
        self.controller = controller
        
        Task{
            await getPokemon()
        }
    }
    
    private func getPokemon() async {
        status = .fetching
        
        do {
            var pokedex = try await controller.fetchAllPokemon()
            
            pokedex.sort { $0.id < $1.id }
            
            for pokemon in pokedex {
                let newPokemon = Pokemon(context: PersistenceController.shared.container.viewContext)
                newPokemon.id = Int16(pokemon.id)
                newPokemon.name = pokemon.name
                newPokemon.types = pokemon.types
                newPokemon.hp = Int16(pokemon.hp)
                newPokemon.attack = Int16(pokemon.attack)
                newPokemon.defense = Int16(pokemon.defence)
                newPokemon.specialAttack = Int16(pokemon.specialAttack)
                newPokemon.specialDefense = Int16(pokemon.specialDefence)
                newPokemon.speed = Int16(pokemon.speed)
                newPokemon.sprite = pokemon.sprite
                newPokemon.favorite = false
                
                try PersistenceController.shared.container.viewContext.save()
            }
            
            status = .success
        } catch {
            status = .failed(error: error)
        }
    }
}
