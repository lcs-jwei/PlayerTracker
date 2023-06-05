//
//  PlayerTrackerView.swift
//  PlayerTracker
//
//  Created by Justin Zack Wei on 2023-06-05.
//

import SwiftUI

struct PlayerTrackerView: View {
    var body: some View {
        VStack{
            
            
            HStack{
                VStack{
                    Text("Ajax Knights")
                        .font(Font.custom("MarkerFelt-Thin", size: 50))
                        .padding()
                    
                }
                
                Spacer()
                Text("Opponent")
                    .font(Font.custom("MarkerFelt-Thin", size: 50))
                    .padding()
            }
            Spacer()
        }
    }
}

struct PlayerTrackerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerTrackerView()
    }
}
