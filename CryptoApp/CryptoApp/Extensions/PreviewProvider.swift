//
//  PreviewProvider.swift
//  CryptoApp
//
//  Created by Valerii on 15.05.2024.
//

import Foundation

extension Coin {
    static var simple = Coin(id: "bitcoin",
                             symbol: "btc",
                             name: "Bitcoin",
                             image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
                             currentPrice: 64960,
                             marketCap: 1279681508758,
                             marketCapRank: 1,
                             fullyDilutedValuation: 1364216690103,
                             totalVolume: 26378655395,
                             high24H: 65036,
                             low24H: 61109,
                             priceChange24H: 3677.48,
                             priceChangePercentage24H: 6.00084,
                             marketCapChange24H: 72409272066,
                             marketCapChangePercentage24H: 5.99776,
                             circulatingSupply: 19698712,
                             totalSupply: 21000000,
                             maxSupply: 21000000,
                             ath: 73738,
                             athChangePercentage: -12.14304,
                             athDate: "2024-03-14T07:10:36.635Z",
                             atl: 67.81,
                             atlChangePercentage: 95438.80881,
                             atlDate: "2013-07-06T00:00:00.000Z",
                             lastUpdated: "2024-05-15T17:14:54.811Z",
                             sparklineIn7D: nil,
                             priceChangePercentage24HInCurrency:  6.000839393180678,
                             currentHoldings: 1.5)
}

extension Statistic {
    static var simple = Statistic(title: "Market Cap", value: "$12.5Bn", percentageChange: 25.34)
}
