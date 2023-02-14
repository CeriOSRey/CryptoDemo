//
//  CircleButtonView.swift
//  CryptoDemo
//
//  Created by Rey Cerio on 2023-02-06.
//

import SwiftUI

struct CircleButtonView: View {
    
    let iconName: String
    
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundColor(Color.theme.accent)
            .frame(width: 50, height: 50)
            .background(
                Circle()
                    .foregroundColor(Color.theme.background)
            )
            .shadow(color: Color.theme.accent, radius: 10)
    }
}

struct CircleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        /// Because this is just a view and not the whole screen, we make the preview only show the view
        
        CircleButtonView(iconName: "heart.fill")
            .previewLayout(.sizeThatFits)
        
        CircleButtonView(iconName: "person.fill")
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
