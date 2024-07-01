//
//  XMArkButton.swift
//  CryptoApp
//
//  Created by Valerii on 02.07.2024.
//

import SwiftUI

struct XMArkButton: View {
    
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: "xmark")
                .font(.headline)
        }
    }
}

#Preview {
    XMArkButton() {}
}
