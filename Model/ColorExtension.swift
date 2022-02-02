import SwiftUI

extension Color {
    static func rgb(r: Double, g: Double, b: Double) -> Color {
        return Color(red: r / 255, green: g / 255, blue: b / 255)
    }
    
    static let moreDarkerColor = Color.rgb(r: 137, g: 70, b: 166)
    static let darkerColor = Color.rgb(r: 183, g: 98, b: 193)
    static let lighterColor = Color.rgb(r: 234, g: 153, b: 213)
    static let moreLighterColor = Color.rgb(r: 255, g: 205, b: 221)
}
