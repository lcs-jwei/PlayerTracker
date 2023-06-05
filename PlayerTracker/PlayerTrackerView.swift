//
//  PlayerTrackerView.swift
//  PlayerTracker
//
//  Created by Justin Zack Wei on 2023-06-05.
//

import SwiftUI

struct PlayerTrackerView: View {
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
                    Text("GOAL")
                        .font(Font.custom("MarkerFelt-Thin", size: 50))
                    
                        .foregroundColor(.white)
                        .padding()
                    
                        .background(Color.green)
                        .cornerRadius(10)
                        .padding()
                        
                }
                
                Spacer()
            }
            VStack{
                
                
                HStack{
                    VStack{
                        Text("Ajax Knights")
                            .font(Font.custom("MarkerFelt-Thin", size: 50))
                            .padding()
                            
                            .border(Color.red, width: 10)
                            .padding()
                            
                        
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
                            .padding()
                        
                            .background(Color.gray)
                            .cornerRadius(10)
                            .padding()
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
    }
}
