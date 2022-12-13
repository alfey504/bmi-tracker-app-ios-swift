//
//  UIButtonAsRadioButton.swift
//  BMI-Tracker-App
//
//  Created by Abraham Alfred Babu on 2022-12-12.
//

import Foundation
import UIKit
 
extension UIButton {
    
    func setSelected(selected: Bool){
        if(selected){
            let color = UIColor(red: 4/255, green: 76/255, blue: 92/255, alpha: 1)
            self.backgroundColor = color
            self.layer.cornerRadius = 12
            self.layer.borderWidth = 0.2
            self.layer.borderColor = color.cgColor

        }else{
            let color = UIColor(red: 4/255, green: 76/255, blue: 92/255, alpha: 1)
            self.backgroundColor = .clear
            self.layer.cornerRadius = 12
            self.layer.borderWidth = 0.2
            self.layer.borderColor = color.cgColor
        }
    }
}
