//
//  HomeViewModel.swift
//  CryptoApp
//
//  Created by Valerii on 22.05.2024.
//

import Foundation

final class HomeViewModel: ObservableObject {
    
  
    
    @Published var allCoins: [Coin] = []
    @Published var portfolioCoins: [Coin] = []
   
    init() {
        allCoins = [.simple]
        portfolioCoins = [.simple]
    }
}
