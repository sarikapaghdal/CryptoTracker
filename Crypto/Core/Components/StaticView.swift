//
//  StaticView.swift
//  Crypto
//
//  Created by Sarika on 12.05.22.
//

import SwiftUI

struct StaticView: View {
    
    let stat: StatisticModel
    
    var body: some View {
        VStack (alignment: .leading, spacing: 4) {
            Text(stat.title)
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
            Text(stat.value)
                .font(.headline)
                .foregroundColor(Color.theme.accent)
            
            HStack(spacing: 4) {
                Image(systemName: "triangle.fill")
                    .font(.caption2)
                    .rotationEffect(Angle(degrees: (stat.percentageChange ?? 0) >= 0 ? 0: 180))
                Text(stat.percentageChange?.asPercentString() ?? "")
                    .font(.caption)
                .bold()
            }
            .foregroundColor((stat.percentageChange ?? 0) >= 0 ? Color.theme.green : Color.theme.red)
            .opacity(stat.percentageChange == nil ? 0.0 : 1.0)
        }
    }
}

struct StaticView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            StaticView(stat: dev.stat1)
                .previewLayout(.sizeThatFits)
            
            StaticView(stat: dev.stat2)
                .previewLayout(.sizeThatFits)
            
            StaticView(stat: dev.stat3)
                .previewLayout(.sizeThatFits)
        }
    }
}
