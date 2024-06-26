//
//  HomeView.swift
//  CryptoApp
//
//  Created by Valerii on 13.05.2024.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    
    @State private var isShowPortfolio = false
    @State private var isShowPortfolioView = false
    
    var body: some View {
        ZStack {
            // background layer
            Color.theme.background
                .ignoresSafeArea()
                .sheet(isPresented: $isShowPortfolioView) {
                    PortfolioView()
                        .environmentObject(vm)
                }
            
            // content layer
            VStack {
                homeHeader
                
                HomeStatsView(showPortfolio: $isShowPortfolio)
                
                SearchBarView(searchText: $vm.searchText)
                
                columnTitles
                
                if !isShowPortfolio {
                    allCoinsList
                        .transition(.move(edge: .leading))
                } else {
                    portfolioCoinsList
                        .transition(.move(edge: .trailing))
                }
                
                Spacer(minLength: 0)
            }
        }
    }
}

#Preview {
    NavigationView {
        HomeView()
    }
    .navigationBarHidden(true)
    .environmentObject(HomeViewModel())
}

extension HomeView {
    
    private var homeHeader: some View {
        HStack {
            CircleButtonView(iconName: isShowPortfolio ? "plus" : "info")
                .animation(.none)
                .onTapGesture {
                    if isShowPortfolio {
                        isShowPortfolioView.toggle()
                    }
                }
                .background(
                    CircleButtonAnimationView(isAnimate: $isShowPortfolio)
                )
            
            Text(isShowPortfolio ? "Portfolio" : "Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
                .animation(.none)
                .frame(maxWidth: .infinity)
            
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(.degrees(isShowPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()) {
                        isShowPortfolio.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
    
    private var allCoinsList: some View {
        List {
            ForEach(vm.allCoins) { coin in
                CoinRowView(coin: coin, showHoldingsColumn: false)
                    .listRowInsets(.init(top: 10,
                                         leading: 0,
                                         bottom: 10,
                                     trailing: 10))
            }
        }
        .listStyle(.plain)
    }
    
    private var portfolioCoinsList: some View {
        List {
            ForEach(vm.portfolioCoins) { coin in
                CoinRowView(coin: coin, showHoldingsColumn: true)
                    .listRowInsets(.init(top: 10,
                                         leading: 0,
                                         bottom: 10,
                                     trailing: 10))
            }
        }
        .listStyle(.plain)
    }
    
    private var columnTitles: some View {
        HStack {
            Text("Coin")
            
            Spacer()
            
            if isShowPortfolio {
                Text("Holdings")
            }
            
            Text("price")
                .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
        }
        .font(.caption)
        .foregroundColor(Color.theme.secondaryText)
        .padding(.horizontal)
    }
}
