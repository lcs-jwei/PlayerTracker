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
    
    
    @AppStorage ("isselected") var isSelected = false
    @AppStorage("plusminus") var plmi = 0
    @State var isPressed = false
    @State var timer: Timer?
    @State var elapsedTime = 0.0
    
    
    
    //MARK: COMPUTED PROPERTIES
    var body: some View {
        Button(action: {
            self.isSelected.toggle()
            self.isPressed.toggle()
            if isPressed {
                                timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                                    elapsedTime += 1
                                }
                            } else {
                                timer?.invalidate()
                                timer = nil
                                elapsedTime = elapsedTime
                            }
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
                            Text("\(plmi)")
                                .font(Font.custom("MarkerFelt-Thin", size: 20))
                                .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))                        .foregroundColor(.white)
                            
                                
                        }
                        .border(.white, width:5)
                        VStack{
                            Text("Time On")
                                .font(Font.custom("MarkerFelt-Thin", size: 20))
                                .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))                        .foregroundColor(.white)
                                .border(.white)
                                
                            Text("\(formattedTime(elapsedTime))")
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
                
                
func formattedTime(_ time: TimeInterval) -> String {
    let minutes = Int(time) / 60
    let seconds = Int(time) % 60
    
    return String(format: "%02d:%02d", minutes, seconds)
}
            
            
            
        

     
    


struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView(name: "Johnny Johnson", number: 35, plmi: 4)
    }
}
