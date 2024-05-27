//
//  HomeViewModel.swift
//  CryptoApp
//
//  Created by Valerii on 22.05.2024.
//

import Foundation
import Combine

final class HomeViewModel: ObservableObject {
        
    @Published var allCoins: [Coin] = []
    @Published var portfolioCoins: [Coin] = []
    
    private let dataService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()
   
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        dataService.$allCoins
            .sink {  [weak self] returnedCoins in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
    }
}
