//
//  CoinImageService.swift
//  CryptoApp
//
//  Created by Valerii on 04.06.2024.
//

import SwiftUI
import Combine

class CoinImageService {
    
    @Published var image: UIImage?
    
    private var imageSubscription: AnyCancellable?
    private let coin: Coin
    
    init(coin: Coin) {
        self.coin = coin
        getCoinImage()
    }
    
    func getCoinImage() {
        guard let url = URL(string: coin.image) else { return }
        
        imageSubscription = NetworkingManager.download(url: url)
            .tryMap { data in
                return UIImage(data: data)
            }
            .sink(receiveCompletion: NetworkingManager.handleCompletion, 
                  receiveValue: { [weak self] returnedImage in
                self?.image = returnedImage
                self?.imageSubscription?.cancel()
            })
    }
}
