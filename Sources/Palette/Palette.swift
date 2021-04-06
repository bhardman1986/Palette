//
//  Colors.swift
//  Taskd
//
//  Created by Bret Hardman on 1/31/20.
//  Copyright © 2020 Bret Hardman. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

///A Palette is a collection of colors
public struct Palette: View {
    
    public enum Shade {
        case _50
        case _100
        case _200
        case _300
        case _400
        case _500
        case _600
        case _700
        case _800
        case _900
        case a100
        case a200
        case a400
        case a700
    }
    
    public enum TextStyle {
        case primary
        case secondary
        case hint
        case error
    }
    
    @Environment (\.colorScheme) var colorScheme: ColorScheme
    
//    MARK: - Static props
    
    static public let clear: Palette = Palette(netHex: 00000000)
    static public let canvas: Palette = Palette("Canvas")
    static public let divider: Palette = Palette("Divider")
    static public let error: Palette = Palette("Error")
    static public let grouped: Palette = Palette("Grouped")
    static public let success: Palette = Palette("Success")
    
    static public let paper: Palette = Palette("Paper")
    static public let paperZ1: Palette = Palette("Paper-Z1")
    static public let paperZ2: Palette = Palette("Paper-Z2")
    static public let paperZ3: Palette = Palette("Paper-Z3")
    static public let paperZ4: Palette = Palette("Paper-Z4")
    static public let paperZ6: Palette = Palette("Paper-Z6")
    static public let paperZ8: Palette = Palette("Paper-Z8")
    static public let paperZ12: Palette = Palette("Paper-Z12")
    static public let paperZ16: Palette = Palette("Paper-Z16")
    static public let paperZ24: Palette = Palette("Paper-Z24")

    
    static public let primary: Palette = Palette("Primary")
    static public let primaryAccent: Palette = Palette("Primary-Accent")
    static public let primaryDark: Palette = Palette("Primary-Dark")
    static public let primaryLight: Palette = Palette("Primary-Light")

    static public let secondary: Palette = Palette("Secondary")
    static public let secondaryAccent: Palette = Palette("Secondary-Accent")
    static public let secondaryDark: Palette = Palette("Secondary-Dark")
    static public let secondaryLight: Palette = Palette("Secondary-Light")

    static public let textPrimary: Palette = Palette("Text-Primary")
    static public let textSecondary: Palette = Palette("Text-Secondary")
    static public let textHint: Palette = Palette("Text-Hint")
    
//    MARK: - Props
    
    internal let uiColor: UIColor
        
//    MARK: - Init
    
    init(netHex: Int) {
        self.uiColor = UIColor(netHex: netHex)
    }
    
    init(_ named: String) {
        print(named)
        
        
        self.uiColor = UIColor(named: named, in: Bundle.module, compatibleWith: nil)!
    }
    
    init(_ uiColor: UIColor) {
        self.uiColor = uiColor
    }
        
//    MARK: - Methods
    
    func preferedDarkText() -> Bool {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0

        uiColor.getRed(&r, green: &g, blue: &b, alpha: &a)

        let value = ((r*299) + (g*587) + (b*114)) / 1000
                
        if value < 0.55 {
            return false
        }
        
//        ((Red value * 299) + (Green value * 587) + (Blue value * 114)) / 1000
        return true
    }
    
    func preferredTextPalette() -> Palette {
        if preferedDarkText() {
            return Palette("Text-Primary-Dark-Content")
        }
        
        return Palette("Text-Primary-Light-Content")
    }
    
    
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0

        uiColor.getRed(&r, green: &g, blue: &b, alpha: &a)

        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0

        return String(format:"#%06x", rgb)
    }
    
    func toColor() -> Color {        
        return Color(uiColor)
    }
        
//    MARK: - Body
    
    public var body: Color {
        Color(uiColor)
    }
    
}

//      MARK: - Palette Class Functions

public extension Palette {
    internal static func paletteShadeAccentToString(_ shade: Shade) -> String {
        switch shade {
        case .a100:
            return "A100"
        case .a200:
            return "A200"
        case .a400:
            return "A400"
        case .a700:
            return "A700"
        default:
            return ""
        }
    }
    
    internal static func paletteShadeToString(_ shade: Shade, hasAccent: Bool) -> String {
        if (hasAccent) {
            let accent = paletteShadeAccentToString(shade)

            if accent != "" {
                return accent
            }
        }
        
        switch shade {
        case ._50:
            return "50"
        case ._100:
            return "100"
        case ._200:
            return "200"
        case ._300:
            return "300"
        case ._400:
            return "400"
        case ._600:
            return "600"
        case ._700:
            return "700"
        case ._800:
            return "800"
        case ._900:
            return "900"
        default:
            return "500"
        }
    }
    
    static func red(_ shade: Shade) -> Palette {
        return Palette("RED_" + paletteShadeToString(shade, hasAccent: true))
    }
    
    static func pink(_ shade: Shade) -> Palette {
        return Palette("PINK_" + paletteShadeToString(shade, hasAccent: true))
    }
    
    static func purple(_ shade: Shade) -> Palette {
        return Palette("PURPLE_" + paletteShadeToString(shade, hasAccent: true))
    }
    
    static func deepPurple(_ shade: Shade) -> Palette {
        return Palette("DEEP-PURPLE_" + paletteShadeToString(shade, hasAccent: true))
    }
    
    static func indigo(_ shade: Shade) -> Palette {
        return Palette("INDIGO_" + paletteShadeToString(shade, hasAccent: true))
    }
    
    static func blue(_ shade: Shade) -> Palette {
        return Palette("BLUE_" + paletteShadeToString(shade, hasAccent: true))
    }
    
    static func lightBlue(_ shade: Shade) -> Palette {
        return Palette("LIGHT-BLUE_" + paletteShadeToString(shade, hasAccent: true))
    }
    
    static func cyan(_ shade: Shade) -> Palette {
        return Palette("CYAN_" + paletteShadeToString(shade, hasAccent: true))
    }
    
    static func teal(_ shade: Shade) -> Palette {
        return Palette("TEAL_" + paletteShadeToString(shade, hasAccent: true))
    }
    
    static func green(_ shade: Shade) -> Palette {
        return Palette("GREEN_" + paletteShadeToString(shade, hasAccent: true))
    }
    
    static func lightGreen(_ shade: Shade) -> Palette {
        return Palette("LIGHT-GREEN_" + paletteShadeToString(shade, hasAccent: true))
    }
    
    static func lime(_ shade: Shade) -> Palette {
        return Palette("LIME_" + paletteShadeToString(shade, hasAccent: true))
    }
    
    static func yellow(_ shade: Shade) -> Palette {
        return Palette("YELLOW_" + paletteShadeToString(shade, hasAccent: true))
    }
    
    static func amber(_ shade: Shade) -> Palette {
        return Palette("AMBER_" + paletteShadeToString(shade, hasAccent: true))
    }
    
    static func orange(_ shade: Shade) -> Palette {
        return Palette("ORANGE_" + paletteShadeToString(shade, hasAccent: true))
    }
    
    static func deepOrange(_ shade: Shade) -> Palette {
        return Palette("DEEP-ORANGE_" + paletteShadeToString(shade, hasAccent: true))
    }
    
    static func brown(_ shade: Shade) -> Palette {
        return Palette("BROWN_" + paletteShadeToString(shade, hasAccent: false))
    }
    
    static func grey(_ shade: Shade) -> Palette {
        return Palette("GREY_" + paletteShadeToString(shade, hasAccent: false))
    }
    
    static func blueGrey(_ shade: Shade) -> Palette {
        return Palette("BLUE-GREY_" + paletteShadeToString(shade, hasAccent: false))
    }
}

//      MARK: - Color Extension

public extension Color {
    init(netHex:Int) {
        self.init(UIColor(netHex: netHex))
    }
    
    init(_ palette: Palette) {
        self = palette.toColor()
    }
}
