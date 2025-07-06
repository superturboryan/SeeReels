//
//  Color.swift
//  Bike Connect
//
//  Created by Ryan on 2025-06-01.
//

import SwiftUI

extension Color {
    
    static let systemBackground = Color(uiColor: .systemBackground)
    static let secondarySystemBackground = Color(uiColor: .secondarySystemBackground)
}

extension AngularGradient {
    
    static let igStyle = AngularGradient(
        gradient: Gradient(colors: [
            Color(red: 254/255, green: 218/255, blue: 117/255),
            Color(red: 250/255, green: 126/255, blue:  30/255),
            Color(red: 214/255, green:  41/255, blue: 118/255),
            Color(red: 150/255, green:  47/255, blue: 191/255),
            Color(red:  79/255, green:  91/255, blue: 213/255),
            Color(red: 254/255, green: 218/255, blue: 117/255) // loop back
        ]),
        center: .center
    )
}
