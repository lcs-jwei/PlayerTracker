//
//  PlayerView.swift
//  PlayerTracker
//
//  Created by Justin Zack Wei on 2023-06-06.
//

import SwiftUI
import Blackbird

struct PlayerView: View {
    //MARK: STORED PROPERTIES
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    @BlackbirdLiveModels({db in
        try await Player.read(from:db)
        
    })var Players
    
    let name: String
    let number: Int
    let time: String
    
    @State var isSelected = false
    @AppStorage("plusminus") var plusminus = 0
    
    //MARK: COMPUTED PROPERTIES
    var body: some View {
        Button(action: {
            self.isSelected.toggle()
        }) {
            VStack{
                HStack{
                    
                    VStack{
                        Image(systemName:"person")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 30)
                            .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 0))
                            .foregroundColor(.white)
                        
                            .cornerRadius(10)
                            .padding(5)
                            
                        Text("#\(number)")
                            .font(Font.custom("MarkerFelt-Thin", size: 20))
                            .foregroundColor(.white)
                            .padding(.leading)
                    }
                    
                    VStack{
                        Text(name)
                            .font(Font.custom("MarkerFelt-Thin", size: 20))
                            .padding()
                            .foregroundColor(.white)
                            
                        VStack{
                            Text("Plus/Minus")
                                .font(Font.custom("MarkerFelt-Thin", size: 20))
                                .padding(EdgeInsets(top: 10, leading: 10, bottom: 5, trailing: 10))                        .foregroundColor(.white)
                                .border(.white)
                            Text("\(plusminus)")
                                .font(Font.custom("MarkerFelt-Thin", size: 20))
                                .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))                        .foregroundColor(.white)
                            
                                
                        }
                        .border(.white, width:5)
                        VStack{
                            Text("Time On")
                                .font(Font.custom("MarkerFelt-Thin", size: 20))
                                .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))                        .foregroundColor(.white)
                                .border(.white)
                                
                            Text(time)
                                .font(Font.custom("MarkerFelt-Thin", size: 20))
                                .padding()
                                .foregroundColor(.white)
                        }
                        .border(.white, width:5)
                        .padding()
                            
                    }
                    
                }
                
                    
                
                
            }
            .border(isSelected ? Color.green : Color.primary, width: 10)
                .cornerRadius(20)
            .background(RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color.indigo))
        }
                      
                            
                        
                        
                    }
                    
                    
                }
                
                
            
            
            
            
        

     
    


struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView(name: "Johnny Johnson", number: 35, time: "15m 32s", plusminus: 4)
    }
}
