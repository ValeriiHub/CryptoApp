//
//  CircleButtonAnimationView.swift
//  CryptoApp
//
//  Created by Valerii on 13.05.2024.
//

import SwiftUI

struct CircleButtonAnimationView: View {
    
    @Binding var isAnimate: Bool
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 5)
            .scale(isAnimate ? 1 : 0)
            .opacity(isAnimate ? 0 : 1)
            .animation(isAnimate ? .easeOut(duration: 1) : .none)
    }
}

#Preview {
    CircleButtonAnimationView(isAnimate: .constant(false))
}
