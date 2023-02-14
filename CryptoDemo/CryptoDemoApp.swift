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

    @StateObject private var vm = HomeViewModel()
    
    var body: some Scene {
        
        WindowGroup {
            NavigationView {
                HomeView()
                    .toolbar(.hidden)
            }
            .environmentObject(vm)   // all the children of this navigation view has access to the vm variable
        }
    }
}
