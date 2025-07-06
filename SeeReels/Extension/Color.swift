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

extension UIColor {
    
    static func hex(_ hex: String) -> UIColor {
        var sanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        if sanitized.hasPrefix("#") {
            sanitized.removeFirst()
        }
        
        let length = sanitized.count
        guard length == 6 else {
            fatalError()
        }
        
        var rgbValue: UInt64 = 0
        let scanner = Scanner(string: sanitized)
        guard scanner.scanHexInt64(&rgbValue) else {
            fatalError()
        }
        
        let r = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let g = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let b = CGFloat(rgbValue & 0x0000FF) / 255.0
        
        return UIColor(red: r, green: g, blue: b, alpha: 1.0)
    }
}

extension LinearGradient {
    
    static let igStyle = LinearGradient(
        gradient: Gradient(colors: [
            .blue,
            .red
        ]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
