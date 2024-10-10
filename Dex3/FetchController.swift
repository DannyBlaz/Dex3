//
//  FetchController.swift
//  Dex3
//
//  Created by Daniel Ezekiel on 9/26/24.
//

import Foundation

struct FetchController {
    enum NetworkError: Error{
        case badURL, badResponse, badData
    }
    
    private let baseURL = URL(string: "https://pokeapi.co/api/v2/pokemon")!
    
    func fetchAllPokemon() async throws -> [TempPokemon] {
        var allPokemon: [TempPokemon] = []
        
        return allPokemon
    }
}
