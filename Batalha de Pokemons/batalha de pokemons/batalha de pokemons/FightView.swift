

import SwiftUI
import Kingfisher


struct FightView: View {
    @State var name: String
    @State var image: String
    @State var atk: Int
    @State var hp: Int
    @State var hpBot: Int
    @State var hpReset: Int
    @State var nameenemy: String
    @State var imageenemy : String
    @State var hpResetenemy : Int
    var body: some View {
        
        
        
        NavigationView {
            
            HStack {
                //UI USER
                VStack{
                Text(name.capitalized)
                    .italic()
                    .foregroundColor(Color.black)
                KFImage(URL(string: image))
                .interpolation(.none)
                .resizable()
                .frame(width: 110, height: 110)
                .shadow(color: .black, radius: 10)
                Text("HP: \(hp)")
             
                    Text("Atk")
                        .background(Color.black)
                        .cornerRadius(5)
                        .foregroundColor(Color.white)
                        .font(.largeTitle)
                        .padding()
                        .onTapGesture(perform: {
                            
                            atacar()
                            winLose()
                            
                        })
                }
                .padding(50)
                
                //ENIMIGO
                VStack
                {
            
                    Text(nameenemy.capitalized)
                        .italic()
                        .foregroundColor(.green)
                    KFImage(URL(string: imageenemy))
                        .interpolation(.none)
                        .resizable()
                        .frame(width: 110, height: 110)
                        .shadow(color: .black, radius: 10)
                    Text("HP: \(hpBot)")
                    
                    Text("Atk")// So para ficar ao mesmo nivel
                        .background(Color.white)
                        .cornerRadius(5)
                        .foregroundColor(Color.white)
                        .font(.largeTitle)
                        .padding()
                    
                    
                }
                .padding(50)
                
            }
            
        }.navigationTitle("POKEMON BATTLE")
        
    }
    
    func atacar(){
        hpBot = hpBot - atk
        hp = hp - 25
    }
    
    func winLose(){
        if(hp <= 0) {
            hp = hpReset
            hpBot = hpReset
            print("Perdeste")
        }
        
        if(hpBot <= 0) {
            hp = hpReset
            hpBot = hpResetenemy
            print("Ganhaste")
        }
    }
}
