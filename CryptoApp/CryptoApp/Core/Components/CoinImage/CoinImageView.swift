//
//  CoinImageView.swift
//  CryptoApp
//
//  Created by Valerii on 04.06.2024.
//

import SwiftUI

struct CoinImageView: View {
    
    @StateObject private var vm: CoinImageViewModel
    
    init(coin: Coin) {
        _vm = StateObject(wrappedValue: CoinImageViewModel(coin: coin))
    }
    
    var body: some View {
        ZStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else if vm.isLoading {
                ProgressView()
            } else {
                Image(systemName: "questionmark")
                    .foregroundColor(.theme.secondaryText)
            }
        }
    }
}

#Preview {
    CoinImageView(coin: .simple)
}
