//
//  Color.swift
//  jokesapart
//
//  Created by Omkar Vijay Bagade on 26/11/25.
//

import Foundation
import SwiftUI

extension Color{
    static let theme = ColorTheme()
}
struct ColorTheme{
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let star = Color("StarColor")
    let green = Color("Green")
    let darkGreen = Color("DarkGreen")
    let inputField = Color("InputField")
}
