//
//  SwichtViewModifier.swift
//  BMI-Tracker-App
//
//  Created by Abraham Alfred Babu on 2022-12-12.
//

import UIKit

extension UISwitch {
    
    func set(width: CGFloat, height: CGFloat) {

            let standardHeight: CGFloat = 31
            let standardWidth: CGFloat = 51

            let heightRatio = height / standardHeight
            let widthRatio = width / standardWidth

            transform = CGAffineTransform(scaleX: widthRatio, y: heightRatio)
    }
}
