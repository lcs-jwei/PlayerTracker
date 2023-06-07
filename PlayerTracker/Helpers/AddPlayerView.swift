//
//  AddPlayerView.swift
//  PlayerTracker
//
//  Created by Justin Zack Wei on 2023-06-06.
//

import SwiftUI
import Blackbird

struct AddPlayerView: View {
//MARK: STORED PROPERTIES
    
    @Environment(\.blackbirdDatabase) var db: Blackbird.Database?
    
    
    @State var name = ""
    @State var number = 00
    @State var plusminus = 3
    @State var time = ""
    
    
    
    //MARK: COMPUTED PROPERTIES
    var body: some View {
        NavigationView{
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
                
                TextField("eg. 34", value:$number, format:.number)
                    .textFieldStyle(.roundedBorder)
                    .font(Font.custom("MarkerFelt-Thin", size: 30))
                    .padding()
                    .border(.blue, width:10)
                    .padding()
                
                
                
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {
                        // Write to database
                        Task {
                            try await db!.transaction { core in
                                try core.query("""
                                                 INSERT INTO Player (
                                                     name,
                                                     number
                                                 )
                                                 VALUES (
                                                     (?),
                                                     (?)
                                                 )
                                                 """,
                                               name,
                                               number)
                            }
                            // Reset input fields after writing to database
                            name = ""
                            number = 0
                        }
                    }, label: {
                        Text("Add")
                        //Label("Add", systemName:"plus.circle.fill")
                        
                    })
                }
            }
        }
    }
}

struct AddPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        AddPlayerView()
            .previewInterfaceOrientation(.landscapeLeft)
            .environment(\.blackbirdDatabase, AppDatabase.instance)
    }
}
