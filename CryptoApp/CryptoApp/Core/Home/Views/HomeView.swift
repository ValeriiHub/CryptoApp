//
//  HomeView.swift
//  CryptoApp
//
//  Created by Valerii on 13.05.2024.
//

import SwiftUI

struct HomeView: View {
    
    @State private var isShowPortfolio = false
    
    var body: some View {
        ZStack {
            // background layer
            Color.theme.background
                .ignoresSafeArea()
            
            // content layer
            VStack {
                homeHeader
                
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
}

extension HomeView {
    
    private var homeHeader: some View {
        HStack {
            CircleButtonView(iconName: isShowPortfolio ? "plus" : "info")
                .animation(.none)
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
}
