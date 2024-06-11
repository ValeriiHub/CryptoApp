//
//  UIApplication.swift
//  CryptoApp
//
//  Created by Valerii on 12.06.2024.
//

import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
