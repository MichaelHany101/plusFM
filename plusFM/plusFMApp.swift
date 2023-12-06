//
//  plusFMApp.swift
//  plusFM
//
//  Created by Michael Hany on 06/12/2023.
//

import SwiftUI

@main
struct plusFMApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
