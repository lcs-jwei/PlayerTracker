//
//  PlayerTrackerApp.swift
//  PlayerTracker
//
//  Created by Justin Zack Wei on 2023-06-05.
//

import SwiftUI

@main
struct PlayerTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            PlayerTrackerView()
                .environment(\.blackbirdDatabase, AppDatabase.instance)
        }
    }
}
