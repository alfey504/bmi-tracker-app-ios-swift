//
//  DateModifier.swift
//  BMI-Tracker-App
//
//  Created by Abraham Alfred Babu on 2022-12-13.
//

import Foundation

extension Date {
    
    // returns formatted date from Date() object in format 12 Dec, 2022 11:00 AM
    var getStringForCell: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM, yyyy hh:mm a"
        return dateFormatter.string(from: self)
    }
}
