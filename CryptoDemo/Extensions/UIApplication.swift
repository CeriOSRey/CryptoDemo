//
//  UIApplication.swift
//  CryptoDemo
//
//  Created by Rey Cerio on 2023-02-06.
//

import Foundation
import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
