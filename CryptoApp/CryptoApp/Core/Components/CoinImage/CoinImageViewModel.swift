//
//  CoinImageViewModel.swift
//  CryptoApp
//
//  Created by Valerii on 04.06.2024.
//

import SwiftUI
import Combine

class CoinImageViewModel: ObservableObject {
    @Published var image: UIImage?
    @Published var isLoading = false
    
    private let coin: Coin
    private let dataService: CoinImageService
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: Coin) {
        self.coin = coin
        self.dataService = CoinImageService(coin: coin)
        addSubscribers()
    }
    
    private func addSubscribers() {
        isLoading = true
        
        dataService.$image
            .sink { [weak self] _ in
                self?.isLoading = false
            } receiveValue: { [weak self] returnedImage in
                self?.image = returnedImage
            }
            .store(in: &cancellables)
    }
}
