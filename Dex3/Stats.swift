//
//  Stats.swift
//  Dex3
//
//  Created by Daniel Ezekiel on 11/5/24.
//

import SwiftUI
import Charts

struct Stats: View {
    @EnvironmentObject var pokemon: Pokemon
    var body: some View {
        Chart(pokemon.stats) { stat in
        }
    }
}

#Preview {
    Stats()
        .environmentObject(SamplePokemon.samplePokemon)
}
