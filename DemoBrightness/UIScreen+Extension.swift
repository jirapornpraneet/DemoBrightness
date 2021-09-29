//
//  UIScreen+Extension.swift
//  DemoBrightness
//
//  Created by Donut on 23/9/2564 BE.
//

import Foundation
import UIKit

extension UIScreen {
    static func setMainBrightness(brightness: CGFloat) {
        guard (0...1).contains(brightness) else {
            print("Attempt to set the screen brightness to an invalid value: \(brightness) should be between 0 and 1 inclusive.")
            return
        }
        print("Brightness\(brightness)")
        self.main.brightness = brightness
    }
    
    private static let step: CGFloat = 0.1
    
    static func animateBrightness(to value: CGFloat) {
        guard fabs(UIScreen.main.brightness - value) > step else { return }
        
        let delta = UIScreen.main.brightness > value ? -step : step
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            UIScreen.main.brightness += delta
            animateBrightness(to: value)
        }
    }
}
