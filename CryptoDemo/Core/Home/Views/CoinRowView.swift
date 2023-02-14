//
//  CoinRowView.swift
//  CryptoDemo
//
//  Created by Rey Cerio on 2023-02-06.
//

import SwiftUI

struct CoinRowView: View {
    
    let coin: CoinModel
    let showHoldingsColumn: Bool
    
    var body: some View {
        GeometryReader { geo in
            HStack(spacing: 20) {
                leftColumnView
                Spacer()
                if showHoldingsColumn {
                    centerColumnView
                }
                rightColumnView
                    .frame(maxWidth: geo.size.width / 3.5, alignment: .trailing)
            }
            .font(.subheadline)
        }
    }
}

struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
            CoinRowView(coin: dev.devCoin, showHoldingsColumn: true)
            CoinRowView(coin: dev.devCoin, showHoldingsColumn: true)
                .preferredColorScheme(.dark)

    }
}

extension CoinRowView {
    private var leftColumnView: some View {
        HStack(spacing: 0) {
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
                .frame(minWidth: 30)
            CoinImageView(vm: CoinImageViewModel(coin: coin))
                .frame(width: 30, height: 30)
            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding(.leading, 6)
                .foregroundColor(Color.theme.accent)
        }
    }
    
    private var centerColumnView: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentHoldingsValue.asCurrencyWith2Decimals())
                .bold()
            Text((coin.currentHoldings ?? 0).asNumberString())
        }
        .foregroundColor(Color.theme.accent)
    }
    
    private var rightColumnView: some View {
        HStack {
            VStack {
                Text(coin.currentPrice?.asCurrencyWith6Decimals() ?? "$0.00")
                    .bold()
                    .foregroundColor(Color.theme.accent)
                Text(coin.priceChangePercentage24H?.asPercentString() ?? "")
                    .foregroundColor(
                        (coin.priceChangePercentage24H ?? 0) >= 0
                        ? Color.theme.green
                        : Color.theme.red
                    )
            }
            
        }
    }
}

