//
//  HomeStatsView.swift
//  Crypto
//
//  Created by Sarika on 12.05.22.
//

import SwiftUI

struct HomeStatsView: View {
    
    let statistics: [StatisticModel] = [
        StatisticModel(title: "title", value: "value", percentageChange: 1.2),
        StatisticModel(title: "title", value: "value"),
        StatisticModel(title: "title", value: "value"),
        StatisticModel(title: "title", value: "value", percentageChange: -23)
    ]
    
    var body: some View {
        HStack {
            ForEach(statistics) { stat in
                StaticView(stat: stat)
                    .frame(width: UIScreen.main.bounds.width / 3)
            }
        }
        .frame(width: UIScreen.main.bounds.width, alignment: .center)
    }
}

struct HomeStatsView_Previews: PreviewProvider {
    static var previews: some View {
        HomeStatsView()
    }
}
