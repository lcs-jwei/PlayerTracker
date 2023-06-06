//
//  PlayerView.swift
//  PlayerTracker
//
//  Created by Justin Zack Wei on 2023-06-06.
//

import SwiftUI

struct PlayerView: View {
    //MARK: STORED PROPERTIES
    
    let name: String
    let number: Int
    let plusminus: Int
    let time: String
    
    //MARK: COMPUTED PROPERTIES
    var body: some View {
        VStack{
            HStack{
                VStack{
                    Image(systemName:"person")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 75)
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 0))
                        .foregroundColor(.white)
                    
                        .cornerRadius(10)
                        .padding(5)
                        
                    Text("#\(number)")
                        .font(Font.custom("MarkerFelt-Thin", size: 50))
                        .foregroundColor(.white)
                        .padding(.bottom)
                }
                
                VStack{
                    Text(name)
                        .font(Font.custom("MarkerFelt-Thin", size: 40))
                        .padding()
                        .foregroundColor(.white)
                        
                    VStack{
                        Text("Plus/Minus")
                            .font(Font.custom("MarkerFelt-Thin", size: 30))
                            .padding(EdgeInsets(top: 10, leading: 10, bottom: 5, trailing: 10))                        .foregroundColor(.white)
                            .border(.white)
                        Text("\(plusminus)")
                            .font(Font.custom("MarkerFelt-Thin", size: 30))
                            .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))                        .foregroundColor(.white)
                        
                            
                    }
                    .border(.white, width:5)
                    VStack{
                        Text("Time On")
                            .font(Font.custom("MarkerFelt-Thin", size: 30))
                            .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))                        .foregroundColor(.white)
                            .border(.white)
                            
                        Text(time)
                            .font(Font.custom("MarkerFelt-Thin", size: 30))
                            .padding()
                            .foregroundColor(.white)
                    }
                    .border(.white, width:5)
                    .padding()
                        
                }
                
            }
            
                
            
            
        }
        .background(RoundedRectangle(cornerRadius: 20)
            .foregroundColor(.mint))
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView(name: "Johnny Johnson", number: 35, plusminus: 5, time: "15m 32s")
    }
}
