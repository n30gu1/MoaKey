//
//  Constants.swift
//  Keyboard
//
//  Created by Park Seongheon on 6/10/24.
//

import UIKit

struct KeyboardMetrics {
    let keyboardHeight: CGFloat
    let keySpacing: CGFloat
    let rowSpacing: CGFloat
    let outerPadding: CGFloat
}

private let metricsByScreenHeight: [CGFloat: KeyboardMetrics] = [
    667.0: KeyboardMetrics(keyboardHeight: 291, keySpacing: 6, rowSpacing: 6, outerPadding: 3), // iPhone SE (2nd, 3rd gen)
    812.0: KeyboardMetrics(keyboardHeight: 292, keySpacing: 5, rowSpacing: 5, outerPadding: 3), // iPhone XS, 11 Pro, mini
    844.0: KeyboardMetrics(keyboardHeight: 292, keySpacing: 5, rowSpacing: 5, outerPadding: 3), // iPhone 12, 12 Pro ~ 14
    852.0: KeyboardMetrics(keyboardHeight: 292, keySpacing: 5, rowSpacing: 5, outerPadding: 3), // iPhone 14 Pro ~ 16
    874.0: KeyboardMetrics(keyboardHeight: 304, keySpacing: 6, rowSpacing: 6, outerPadding: 3), // iPhone 16 Pro
    896.0: KeyboardMetrics(keyboardHeight: 304, keySpacing: 6, rowSpacing: 6, outerPadding: 3), // iPhone XR, XS Max, 11 Pro Max
    926.0: KeyboardMetrics(keyboardHeight: 304, keySpacing: 6, rowSpacing: 6, outerPadding: 3), // iPhone 12 Pro Max ~ 14 Plus
    932.0: KeyboardMetrics(keyboardHeight: 304, keySpacing: 6, rowSpacing: 6, outerPadding: 3), // iPhone 15 Plus, 15 Pro Max, 16 Plus
    956.0: KeyboardMetrics(keyboardHeight: 304, keySpacing: 6, rowSpacing: 6, outerPadding: 4), // iPhone 16 Pro Max
]

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
        if let metric = metricsByScreenHeight[height] {
            return metric.keyboardHeight
        }
        return 292
    }
    
    static func getOuterPadding() -> CGFloat {
        if let metric = metricsByScreenHeight[self.getHeight()] {
            return metric.outerPadding
        }
        return 3
    }
    
    static func getKeySpacing() -> CGFloat {
        if let metric = metricsByScreenHeight[self.getHeight()] {
            return metric.keySpacing
        }
        return 6
    }
    
    static func getRowSpacing() -> CGFloat {
        if let metric = metricsByScreenHeight[self.getHeight()] {
            return metric.rowSpacing
        }
        return 6
    }
}
