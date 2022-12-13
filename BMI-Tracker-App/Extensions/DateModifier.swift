//
//  DateModifier.swift
//  BMI-Tracker-App
//
//  Created by Abraham Alfred Babu on 2022-12-13.
//

import Foundation

extension Date {
    
    var getStringForCell: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM, yyyy hh:mm a"
        return dateFormatter.string(from: self)
    }
}
