//
//  NumberCheckOnString.swift
//  BMI-Tracker-App
//
//  Created by Abraham Alfred Babu on 2022-12-13.
//

import Foundation

extension String {
    
    var isNumber: Bool {
        let digitSet = CharacterSet(charactersIn: "0123456789.")
        return CharacterSet(charactersIn: self).isSubset(of: digitSet)
    }
}
