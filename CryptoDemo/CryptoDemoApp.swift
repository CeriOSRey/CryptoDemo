//
//  CryptoDemoApp.swift
//  CryptoDemo
//
//  Created by Rey Cerio on 2023-02-06.
//

import SwiftUI

@main
struct CryptoDemoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
