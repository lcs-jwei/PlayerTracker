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
    @AppStorage("plusminus") var plmi = 0
    @AppStorage("teamname") var tName = ""
    @State var showingAddPlayerView = false
    @State var showingChangeNameView = false
    @AppStorage ("isselected") var isSelected = false
    @State var isPressed = false
    @AppStorage ("elapsedtime") var elapsedTime = 0.0
    
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    @BlackbirdLiveModels({db in
        try await Player.read(from: db)
    })var Players
    
    //MARK: COMPUTED PROPERTIES
    
    var body: some View {
        NavigationView{
            
            ZStack{
                
                
                
                VStack{
                    HStack{
                        Button(action: {score += 1
                            if isSelected{
                                
                                self.plmi += 1
                            }
                            else{
                                self.plmi += 0
                            }
                            
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
                            if isSelected{
                                
                                self.plmi += -1
                            }else{
                                self.plmi += 0
                            }
                            
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
                            ForEach(Players.results){currentPlayer in
                                PlayerView(name: currentPlayer.name,
                                           number: currentPlayer.number, plmi: currentPlayer.plusminus
                                           
                                )
                            }
                            
                        }
                        
                    }
                        
                    .toolbar {
                        ToolbarItem(placement: .bottomBar) {
                            Button(action: {
                                showingAddPlayerView = true
                            }, label: {
                                HStack{
                                    Image(systemName: "person.circle")
                                    Text("Add/remove Player")
                                        
                                }.padding()
                                    .background(Color.blue)
                                    .cornerRadius(10)
                                    .foregroundColor(.white)
                            })
                            .sheet(isPresented: $showingAddPlayerView) {
                                AddPlayerView()
                                    .presentationDetents([.fraction(0.3)])
                            }
                        }
                    }
                    .padding(40)
                    
                    Button(action: {score = 0
                        oscore = 0
                        plmi = 0
                        elapsedTime = 0.0
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
                            Text("\(tName)")
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
                            showingChangeNameView = true
                        }, label: {
                            HStack{
                                Image(systemName: "person.3.fill")
                                Text("Change Team Name")
                                    
                            }.padding()
                                .background(Color.blue)
                                .cornerRadius(10)
                                .foregroundColor(.white)
                        })
                        .sheet(isPresented: $showingChangeNameView) {
                            NameChangeView()
                                .presentationDetents([.fraction(0.3)])
                        
                        }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                        Spacer()
                    }
                    Spacer()
                    
                }
                
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
    
}

struct PlayerTrackerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerTrackerView()
            .previewInterfaceOrientation(.landscapeLeft)
            .environment(\.blackbirdDatabase, AppDatabase.instance)
    }
}
