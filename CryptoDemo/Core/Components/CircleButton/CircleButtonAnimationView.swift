//
//  CircleButtonAnimationView.swift
//  CryptoDemo
//
//  Created by Rey Cerio on 2023-02-06.
//

import SwiftUI

struct CircleButtonAnimationView: View {
    
    @Binding var animate: Bool
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 1.0)
            .scale((animate ? 1.0 : 0.0))
            .opacity(animate ? 0.0 : 1.0)
            .animation(animate ? Animation.easeOut(duration: 10.0) : .none)
    }
}

struct CircleButtonAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        CircleButtonAnimationView(animate: .constant(true))
            .foregroundColor(.red)
            .frame(width: 100, height: 100)        
    }
}
