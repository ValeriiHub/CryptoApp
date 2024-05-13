//
//  CryptoAppApp.swift
//  CryptoApp
//
//  Created by Valerii on 13.05.2024.
//

import SwiftUI

@main
struct CryptoAppApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
        }
    }
}
