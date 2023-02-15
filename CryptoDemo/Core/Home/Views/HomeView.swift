//
//  HomeView.swift
//  CryptoDemo
//
//  Created by Rey Cerio on 2023-02-06.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @State private var showPortfolio: Bool = false
    
    var body: some View {
        ZStack {
            // Background
            Color.theme.background
                .ignoresSafeArea()
            
            // Foreground
            VStack {
                homeHeaderView
                HomeStatsView(showPortfolio: .constant(false))
                    .frame(height: 50)
                SearchBarView(searchText: $vm.searchText)
                
                columnTitles
                
                if !showPortfolio {
                    allCoinsList.transition(.move(edge: .leading))
                } else {
                    portfolioCoinsList.transition(.move(edge: .trailing))
                }

                Spacer(minLength: 0)
            }
        }
    }
    
    private var allCoinsList: some View {
        List {
            ForEach(vm.allCoins) { coin in
                CoinRowView(coin: coin, showHoldingsColumn: false)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
            
        }
        .listStyle(PlainListStyle())
    }
    
    private var portfolioCoinsList: some View {
        List {
            ForEach(vm.allCoins) { coin in
                CoinRowView(coin: coin, showHoldingsColumn: true)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
            
        }
        .listStyle(PlainListStyle())
    }
    
    private var columnTitles: some View {
        GeometryReader { geo in
            HStack {
                Text("Coin")
                Spacer()
                if showPortfolio {
                    Text("Holdings")
                        .frame(width: geo.size.width / 3.5, alignment: .center)
                }
                Text("Price")
                    .frame(width: geo.size.width / 3.5, alignment: .trailing)

            }
            .font(.caption)
            .foregroundColor(Color.theme.secondaryText)
            .padding(.horizontal)
        }
        .frame(height: 10)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                HomeView()
                    .toolbar(.hidden)
            }
            .environmentObject(dev.homeVM)
            NavigationView {
                HomeView()
                    .toolbar(.hidden)
            }
            .environmentObject(dev.homeVM)
            .preferredColorScheme(.dark)
        }
    }
}

extension HomeView {
    private var homeHeaderView: some View {
        HStack {
            CircleButtonView(iconName: showPortfolio ? "plus" : "info")
                .animation(.none)
                .background(
                    CircleButtonAnimationView(animate: $showPortfolio)
                )
            Spacer()
            Text(showPortfolio ? "Portfolio" : "Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
                .animation(.none)
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()) {
                        showPortfolio.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
}
