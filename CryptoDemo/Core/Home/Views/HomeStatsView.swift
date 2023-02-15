//
//  HomeStatsView.swift
//  CryptoDemo
//
//  Created by Rey Cerio on 2023-02-14.
//

import SwiftUI

struct HomeStatsView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @Binding var showPortfolio: Bool
    
    var body: some View {
        GeometryReader { geo in
            HStack {
                ForEach(vm.statistics) { stat in
                    StatisticView(stat: stat)
                        .frame(width: geo.size.width / 3)
                }
            }
            .frame(alignment: showPortfolio ? .trailing : .leading )
        }
    }
}

struct HomeStatsView_Previews: PreviewProvider {
    static var previews: some View {
        HomeStatsView(showPortfolio: .constant(false))
            .environmentObject(dev.homeVM)
    }
}
