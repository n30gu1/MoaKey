//
//  Constants.swift
//  Keyboard
//
//  Created by Park Seongheon on 6/10/24.
//

import UIKit

let CORNER_RADIUS: CGFloat = 4.8

class Calculator {
    /**
     @return height of the view containing the keyboard buttons
     */
    static func getKeyboardHeight() -> CGFloat{
        let width = getWidth()
        let height = getHeight()
        if UIDevice.current.userInterfaceIdiom == .phone {
            return width < height ? portraitHeightLookup(height) : 162
        } else {
            return width < height ? 265 : 353
        }
    }
    
    /**
     @return the height of the  toolbar
     */
//    static func getToolbar() -> CGFloat{
//        if UIDevice.current.userInterfaceIdiom == .phone {
//            return getWidth() < getHeight() ? 45 : 38
//        }
//        
//        //iPad
//        return 55
//    }
    
    private static func getWidth() -> CGFloat {
        return UIScreen.main.bounds.width
    }
    
    private static func getHeight() -> CGFloat {
        return UIScreen.main.bounds.height
    }
    
    static func portraitHeightLookup(_ height: CGFloat) -> CGFloat {
        switch height {
        case 667.0: // iPhone SE (2nd, 3rd generation)
            return 260
//        case 780.0: // idk what device uses this size but there is
//            return 300
        case 812.0: // iPhone XS, iPhone 11 Pro, iPhone mini
            return 261
        case 844.0: // iPhone 12, iPhone 12 Pro ~ iPhone 14
            return 261
        case 852.0: // iPhone 14 Pro ~ iPhone 16
            return 261
        case 874.0: // iPhone 16 Pro
            return 261
        case 896.0: // iPhone XR, iPhone XS Max, iPhone 11, iPhone 11 Pro Max
            return 271
        case 926.0: // iPhone 12 Pro Max ~ iPhone 14 Plus
            return 271
        case 932.0: // iPhone 15 Plus, iPhone 15 Pro Max, iPhone 16 Plus
            return 271
        case 956.0: // iPhone 16 Pro Max
            return 271
        default:    // Fallback
            return 261
        }
    }
    
    static func getOuterPadding() -> CGFloat {
        switch self.getHeight() {
        case 667.0: // iPhone SE (2nd, 3rd generation)
            return 3
//        case 780.0: // idk what device uses this size but there is
//            return 300
        case 812.0: // iPhone XS, iPhone 11 Pro, iPhone mini
            return 3
        case 844.0: // iPhone 12, iPhone 12 Pro ~ iPhone 14
            return 3
        case 852.0: // iPhone 14 Pro ~ iPhone 16
            return 3
        case 874.0: // iPhone 16 Pro
            return 2.6
        case 896.0: // iPhone XR, iPhone XS Max, iPhone 11, iPhone 11 Pro Max
            return 3
        case 926.0: // iPhone 12 Pro Max ~ iPhone 14 Plus
            return 3
        case 932.0: // iPhone 15 Plus, iPhone 15 Pro Max, iPhone 16 Plus
            return 3
        case 956.0: // iPhone 16 Pro Max
            return 3.6
        default:    // Fallback
            return 3
        }
    }
    
    static func getKeySpacing() -> CGFloat {
        switch self.getHeight() {
        case 667.0: // iPhone SE (2nd, 3rd generation)
            return 6
//        case 780.0: // idk what device uses this size but there is
//            return 300
        case 812.0: // iPhone XS, iPhone 11 Pro, iPhone mini
            return 6
        case 844.0: // iPhone 12, iPhone 12 Pro ~ iPhone 14
            return 6
        case 852.0: // iPhone 14 Pro ~ iPhone 16
            return 6
        case 874.0: // iPhone 16 Pro
            return 7
        case 896.0: // iPhone XR, iPhone XS Max, iPhone 11, iPhone 11 Pro Max
            return 6
        case 926.0: // iPhone 12 Pro Max ~ iPhone 14 Plus
            return 6
        case 932.0: // iPhone 15 Plus, iPhone 15 Pro Max, iPhone 16 Plus
            return 6
        case 956.0: // iPhone 16 Pro Max
            return 6
        default:    // Fallback
            return 6
        }
    }
    
    static func getRowSpacing() -> CGFloat {
        switch self.getHeight() {
        case 667.0: // iPhone SE (2nd, 3rd generation)
            return 6
//        case 780.0: // idk what device uses this size but there is
//            return 300
        case 812.0: // iPhone XS, iPhone 11 Pro, iPhone mini
            return 6
        case 844.0: // iPhone 12, iPhone 12 Pro ~ iPhone 14
            return 6
        case 852.0: // iPhone 14 Pro ~ iPhone 16
            return 6
        case 874.0: // iPhone 16 Pro
            return 12
        case 896.0: // iPhone XR, iPhone XS Max, iPhone 11, iPhone 11 Pro Max
            return 6
        case 926.0: // iPhone 12 Pro Max ~ iPhone 14 Plus
            return 6
        case 932.0: // iPhone 15 Plus, iPhone 15 Pro Max, iPhone 16 Plus
            return 6
        case 956.0: // iPhone 16 Pro Max
            return 6
        default:    // Fallback
            return 6
        }
    }
}
