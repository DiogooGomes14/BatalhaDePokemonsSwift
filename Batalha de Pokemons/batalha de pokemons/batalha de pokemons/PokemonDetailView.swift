

import SwiftUI
import Kingfisher

struct PokemonDetailView: View {
    var pokemon: Pokemon
    @State private var scale: CGFloat = 0

    var body: some View {
        GeometryReader { geo in
            VStack {
            
                NavigationLink(destination: FightView(name: pokemon.name, image: pokemon.imageURL, atk: pokemon.attack, hp: pokemon.attack-10, hpBot:100, hpReset: pokemon.attack-10,nameenemy: "Bulbasaur", imageenemy: "https://firebasestorage.googleapis.com/v0/b/pokedex-bb36f.appspot.com/o/pokemon_images%2F2CF15848-AAF9-49C0-90E4-28DC78F60A78?alt=media&token=15ecd49b-89ff-46d6-be0f-1812c948e334", hpResetenemy: 40)) {
                    Text("BATALHAR!")
                        .background(pokemon.typeColor)
                        .cornerRadius(5)
                        .foregroundColor(Color.white)
                        .font(.title2)
                }
                
                
                Text(pokemon.name.capitalized)
                    .font(.largeTitle)
                Text(pokemon.type.capitalized)
                    .italic()
                    .foregroundColor(pokemon.typeColor)
                
                PokemonImage(image: KFImage(URL(string: pokemon.imageURL)))
                    .padding(.bottom, -100)
                    .zIndex(1)
                
                ZStack {
                    Rectangle()
                        .edgesIgnoringSafeArea(.all)
                        .frame(width: geo.size.width, height: geo.size.height)
                        .foregroundColor(pokemon.typeColor)
                    
                    VStack{
                        Text(pokemon.description
                            .replacingOccurrences(of: "\n", with: ""))
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding()
                        
                        StatusViewGroup(pokemon: pokemon)
                            
                        }
                    }
                    .offset(y: -40)
                    .scaleEffect(scale)
                    .onAppear {
                        let baseAnimation = Animation.spring(dampingFraction: 0.5)
                        let repeated = baseAnimation.repeatCount(1)
                        
                        withAnimation(repeated) {
                            scale = 1
                        }
                    }
                }
            }
        }
        //.navigationBarTitleDisplayMode(.inline)
        
        
        
}

