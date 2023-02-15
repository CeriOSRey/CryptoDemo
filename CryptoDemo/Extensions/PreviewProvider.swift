//
//  PreviewProvider.swift
//  CryptoDemo
//
//  Created by Rey Cerio on 2023-02-06.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    static var dev:  DeveloperPreview {
        return DeveloperPreview.instance
    }
}

/// Only for developer use
class DeveloperPreview {
    static let instance = DeveloperPreview()
    
    private init() {}  // ensure that nobody else initializes another instance
    
    let homeVM = HomeViewModel()
    
    lazy var coinImageVM = CoinImageViewModel(coin: devCoin )
    
    let stat1 = StatisticModel(title: "Market Cap", value: "$12.5Bn", percentageChange: 25.34)
    let stat2 = StatisticModel(title: "Total Volume", value: "$1.23Tn")
    let stat3 = StatisticModel(title: "Portfolio Value", value: "$12.5Bn", percentageChange: -9.47)


    
    let devCoin = CoinModel(
        id: "bitcoin",
        symbol: "btc",
        name: "Bitcoin",
        image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
        currentPrice: 22761,
        marketCap: 438941229569,
        marketCapRank: 1,
        fullyDilutedValuation: 478012962008,
        totalVolume: 33011438985,
        high24H: 23138,
        low24H: 22739,
        priceChange24H: -189.0518620230032, priceChangePercentage24H: -0.82374, marketCapChange24H: -3582688714.750305, marketCapChangePercentage24H: -0.8096,
        circulatingSupply: 19283506,
        totalSupply: 21000000,
        maxSupply: 21000000,
        ath: 69045,
        athChangePercentage: -67.03223,
        athDate: "2021-11-10T14:24:11.849Z",
        atl: 67.81,
        atlChangePercentage: 33468.58529,
        atlDate: "2013-07-06T00:00:00.000Z",
        lastUpdated: "2023-02-06T23:22:06.536Z",
        sparklineIn7D:
            SparklineIn7D(price: [
                23150.92210161341,
                23167.188226957856,
            ]),
        priceChangePercentage24HInCurrency: -0.8237383800810951,
        currentHoldings: 5
    )
}
