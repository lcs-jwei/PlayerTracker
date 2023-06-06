//
//  PlayerTrackerView.swift
//  PlayerTracker
//
//  Created by Justin Zack Wei on 2023-06-05.
//

import SwiftUI
import Blackbird

struct PlayerTrackerView: View {
//MARK: STORED PROPERTIES
    
    @State var score = 0
    @State var oscore = 0
    @State var plmi = 0
    @State var tName = ""
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    @BlackbirdLiveModels({db in
        try await Player.read(from:db)
    })var Players
    
    //MARK: COMPUTED PROPERTIES
    
    var body: some View {
        
        ZStack{
            
            
            VStack{
                HStack{
                    Button(action: {score += 1
                        plmi += 1
                        
                    }) {
                        Text("GOAL")
                            .font(Font.custom("MarkerFelt-Thin", size: 50))
                        
                            .foregroundColor(.white)
                            .padding()
                        
                            .background(Color.green)
                            .cornerRadius(10)
                            .padding()
                    }
                    Text("\(score)-\(oscore)")
                        .font(Font.custom("MarkerFelt-Thin", size: 100))
                        .padding()
                    Button(action: {oscore += 1
                        plmi += -1
                        
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
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(0..<100) { i in
                            Button(action: {
                                
                            }){
                                List(Players.results){currentPlayer in
                                    PlayerView(name: currentPlayer.name,
                                               number: currentPlayer.number,
                                               plusminus: currentPlayer.plusminus,
                                               time: currentPlayer.time
                                               
                                    )
                                }
                            }
                        }
                    }
                }
                            .padding(40)
                            
                            Button(action: {score = 0
                                oscore = 0
                                plmi = 0
                                
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
