//
//  PlayerTrackerView.swift
//  PlayerTracker
//
//  Created by Justin Zack Wei on 2023-06-05.
//

import SwiftUI
import Blackbird

struct PlayerTrackerView: View {
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    @BlackbirdLiveModels({db in
        try await Player.read(from:db)
        
    })var Players
    
   

    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Button(action: {
                        
                    }) {
                        Text("GOAL")
                            .font(Font.custom("MarkerFelt-Thin", size: 50))
                        
                            .foregroundColor(.white)
                            .padding()
                        
                            .background(Color.green)
                            .cornerRadius(10)
                            .padding()
                    }
                    Text("1-0")
                        .font(Font.custom("MarkerFelt-Thin", size: 100))
                        .padding()
                    Button(action: {
                        
                    }) {
                        Text("GOAL")
                            .font(Font.custom("MarkerFelt-Thin", size: 50))
                        
                            .foregroundColor(.white)
                            .padding()
                        
                            .background(Color.green)
                            .cornerRadius(10)
                            .padding()
                    }
                    
                }
                
                Spacer()
                List(Players.results){currentPlayer in
                    PlayerView(name: currentPlayer.name,
                               number: currentPlayer.number,
                               plusminus: currentPlayer.plusminus,
                               time: currentPlayer.time
                               )
                }
                    .padding(40)
                
                Button(action: {
                    
                }) {
                    Text("Game End")
                        .font(Font.custom("MarkerFelt-Thin", size: 30))
                    
                        .foregroundColor(.white)
                        .padding()
                    
                        .background(Color.red)
                        .cornerRadius(10)
                        .padding()
                }
            }
            VStack{
                HStack{
                    VStack{
                        Text("Ajax Knights")
                            .font(Font.custom("MarkerFelt-Thin", size: 50))
                            .padding()
                        
                            .border(Color.red, width: 10)
                            .padding(.leading)
                        
                        
                    }
                    
                    Spacer()
                    Text("Opponent")
                        .font(Font.custom("MarkerFelt-Thin", size: 50))
                        .padding()
                    
                        .border(Color.red, width: 10)
                        .padding()
                }
                HStack{
                    Button(action: {
                        
                    }) {
                        Text("Change Team Name")
                            .font(Font.custom("MarkerFelt-Thin", size: 20))
                        
                            .foregroundColor(.white)
                            .padding(10)
                        
                            .background(Color.blue)
                            .cornerRadius(10)
                            .padding(.leading)
                    }
                    Spacer()
                    
                }
                Spacer()
            }
            
        }
        }
        }

struct PlayerTrackerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerTrackerView()
            .previewInterfaceOrientation(.landscapeLeft)
            .environment(\.blackbirdDatabase, AppDatabase.instance)
    }
}
