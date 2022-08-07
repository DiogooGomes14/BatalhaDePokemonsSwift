

import SwiftUI

struct StatusViewGroup: View {
    var pokemon: Pokemon
    
    var body: some View {
        let hp = pokemon.attack - 5
        ZStack {
            Rectangle()
                .frame(width: 400, height: 250)
                .foregroundColor(.white)
                .opacity(0.6)
                .cornerRadius(20)
            
            VStack(alignment: .leading, spacing: 30) {
                StatusView(pokemon: pokemon, statusName: "HP:      ", statusColor: .green, statusValue: hp)
                StatusView(pokemon: pokemon, statusName: "Attack:  ", statusColor: .red, statusValue: pokemon.attack)
                StatusView(pokemon: pokemon, statusName: "Defense: ", statusColor: .blue, statusValue: pokemon.defense)
                StatusView(pokemon: pokemon, statusName: "Height:  ", statusColor: .teal, statusValue: pokemon.height)
                StatusView(pokemon: pokemon, statusName: "Weight:  ", statusColor: .cyan, statusValue: pokemon.weight)
                
            }
        }
    }
}

struct StatusViewGroup_Previews: PreviewProvider {
    static var previews: some View {
        StatusViewGroup(pokemon: PokemonViewModel().MOCK_POKEMON)
    }
}
