//
//  Player.swift
//  PlayerTracker
//
//  Created by Justin Zack Wei on 2023-06-06.
//

import Foundation
import Blackbird

struct Player: BlackbirdModel {
    
    @BlackbirdColumn var id: Int
    @BlackbirdColumn var name: String
    @BlackbirdColumn var number: Int
    @BlackbirdColumn var time: String
    @BlackbirdColumn var plusminus: Int
    @BlackbirdColumn var isselected: Int
}
