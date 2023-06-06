//
//  AddPlayerView.swift
//  PlayerTracker
//
//  Created by Justin Zack Wei on 2023-06-06.
//

import SwiftUI

struct AddPlayerView: View {
//MARK: STORED PROPERTIES
    
    @State var name = ""
    @State var number = 3
    @State var plusminus = 3
    @State var time = ""
    
    
    
    //MARK: COMPUTED PROPERTIES
    var body: some View {
        VStack{
            Text("Player Name")
                .font(Font.custom("MarkerFelt-Thin", size: 30))
                .padding()
                .border(.blue, width:10)
                .padding()
            
            TextField("Enter player name (First, last)", text:$name)
                .textFieldStyle(.roundedBorder)
                .font(Font.custom("MarkerFelt-Thin", size: 30))
                .padding()
                .border(.blue, width:10)
                .padding()
            Text("Player Number")
                .font(Font.custom("MarkerFelt-Thin", size: 30))
                .padding()
                .border(.blue, width:10)
                .padding()
            
            TextField("eg. 34", text:$name)
                .textFieldStyle(.roundedBorder)
                .font(Font.custom("MarkerFelt-Thin", size: 30))
                .padding()
                .border(.blue, width:10)
                .padding()
            
            
            
        }
    }
}

struct AddPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        AddPlayerView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
