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
    
    func compactify(cuttOff: Int) -> String {
        let lowerBound = index(startIndex, offsetBy: 0)
        let upperBound = index(startIndex, offsetBy: cuttOff-2)
        return String(self[lowerBound...upperBound]) + ".."
    }
}
