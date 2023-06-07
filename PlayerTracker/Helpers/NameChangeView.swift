//
//  NameChangeView.swift
//  PlayerTracker
//
//  Created by Justin Zack Wei on 2023-06-06.
//

import SwiftUI

struct NameChangeView: View {
    
    @AppStorage("teamname") var tName = ""
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Change Your Team Name")
                    .font(Font.custom("MarkerFelt-Thin", size: 30))
                    .padding()
                    .border(.blue, width:10)
                    .padding()
                
                TextField("Enter team name", text: $tName)
                    .textFieldStyle(.roundedBorder)
                    .font(Font.custom("MarkerFelt-Thin", size: 30))
                    .padding()
                    .border(.blue, width:10)
                    .padding()
            }
            
        }
    }
}

struct NameChangeView_Previews: PreviewProvider {
    static var previews: some View {
        NameChangeView(tName:"")
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
