

import SwiftUI

struct StatusView: View {
    var pokemon: Pokemon
    var statusName: String
    var statusColor: Color
    var statusValue: Int
    
    
    var body: some View {
        HStack {
            Text(statusName)
                .font(.system(.body, design: .monospaced))
            
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 5)
                    .foregroundColor(.gray)
                    .frame(width: 100, height: 20)
                
                RoundedRectangle(cornerRadius: 5)
                    .foregroundColor(statusColor)
                    .frame(width: statusValue <= 100 ? 150 * (CGFloat(statusValue) / 100) : 150, height: 20)
              
            }
            Text("\(statusValue)")
                .font(.system(.body, design: .monospaced))
        }
    }
}

struct StatusView_Ppokemon: PreviewProvider {
    static var previews: some View {
        StatusView(pokemon: PokemonViewModel().MOCK_POKEMON, statusName: "Attack", statusColor: .red, statusValue: 55)
    }
}


// *
