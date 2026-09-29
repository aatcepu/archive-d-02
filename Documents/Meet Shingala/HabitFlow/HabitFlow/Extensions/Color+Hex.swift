//
//  Color+Hex.swift
//  HabitFlow
//
//  Lets us store a habit's accent color as a hex string in SwiftData
//  and render it as a SwiftUI Color.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let cleaned = hex.trimmingCharacters(in: .whitespacesAndNewlines)
            .replacingOccurrences(of: "#", with: "")
        var rgb: UInt64 = 0
        Scanner(string: cleaned).scanHexInt64(&rgb)

        let r = Double((rgb & 0xFF0000) >> 16) / 255
        let g = Double((rgb & 0x00FF00) >> 8) / 255
        let b = Double(rgb & 0x0000FF) / 255

        self.init(red: r, green: g, blue: b)
    }
}

/// Curated accent palette offered when creating a habit — kept small and
/// cohesive rather than a full color picker.
enum HabitPalette {
    static let options: [String] = [
        "5B8DEF", // blue
        "6FCF97", // green
        "F2994A", // orange
        "EB5757", // red
        "9B51E0", // purple
        "F2C94C"  // yellow
    ]
}
