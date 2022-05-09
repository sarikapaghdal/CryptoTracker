//
//  CoinRowViews.swift
//  Crypto
//
//  Created by Sarika on 07.05.22.
//

import SwiftUI

struct CoinRowViews: View {
    
    let coin: CoinModel
    let showHoldingColumn : Bool
    
    var body: some View {
        HStack(spacing : 0) {
            leftColumn
            Spacer()
            if showHoldingColumn {
               centerColumn
            }
            rightColumn
        }//Hstack
        .font(.subheadline)
    }
}

struct CoinRowViews_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            CoinRowViews(coin: dev.coin, showHoldingColumn: true)
                .previewLayout(.sizeThatFits)
            
            CoinRowViews(coin: dev.coin, showHoldingColumn: true)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
       
    }
}

extension CoinRowViews {
    
    private var leftColumn: some View {
        HStack(spacing: 0){
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
                .frame(minWidth: 30)
            CoinImageView(coin: coin)
                .frame(width: 30, height: 30)
            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding()
                .foregroundColor(Color.theme.accent)
        }
    }
    
    private var centerColumn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentHoldingsValue.asCurrencyWith2Decimals())
                .bold()
            Text((coin.currentHoldings ?? 0).asNumberString())
        }
        .foregroundColor(Color.theme.accent)
    }
    
    private var rightColumn : some View {
        VStack(alignment: .trailing) {
            Text(coin.currentPrice.asCurrencyWith6Decimals())
                .bold()
                .foregroundColor(Color.theme.accent)
            Text(coin.priceChangePercentage24H?.asPercentString() ?? "0.00%")
                .foregroundColor(
                    (coin.priceChangePercentage24H ?? 0) >= 0 ?
                    Color.theme.green :
                    Color.theme.red
                )
        }//Vstack
        .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing) //we are in portrait mode so we use UIScreen.main.bounds.width otherwise we should use geometry reader
    }
}
