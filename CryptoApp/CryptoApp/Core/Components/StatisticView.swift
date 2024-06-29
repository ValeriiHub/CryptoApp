//
//  StatisticView.swift
//  CryptoApp
//
//  Created by Valerii on 12.06.2024.
//

import SwiftUI

struct StatisticView: View {
    
    let statistic: Statistic
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(statistic.title)
                .font(.caption)
                .foregroundColor(.theme.secondaryText)
            
            Text(statistic.value)
                .font(.headline)
                .foregroundColor(.theme.accent)
            
            HStack(spacing: 4) {
                Image(systemName: "triangle.fill")
                    .font(.caption2)
                    .rotationEffect(.degrees((statistic.percentageChange ?? 0) >= 0 ? 0 : 180))
                
                Text(statistic.percentageChange?.asPercentString() ?? "")
                    .font(.caption)
                    .bold()
            }
            .foregroundColor((statistic.percentageChange ?? 0) >= 0 ? .theme.green : .theme.red)
            .opacity(statistic.percentageChange == nil ? 0 : 1)
        }
    }
}

#Preview {
    StatisticView(statistic: .simple)
}
