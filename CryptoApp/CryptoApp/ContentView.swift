//
//  ContentView.swift
//  CryptoApp
//
//  Created by Valerii on 13.05.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
          
            VStack {
                Text("Hello, world!")
            }
        }
    }
}

#Preview {
    ContentView()
}
