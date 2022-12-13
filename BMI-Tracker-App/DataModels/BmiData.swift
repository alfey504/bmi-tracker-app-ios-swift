//
//  BmiData.swift
//  BMI-Tracker-App
//
//  Created by Abraham Alfred Babu on 2022-12-13.
//

import Foundation

class BmiData {
    
    var name: String
    var gender: String
    
    var preferedUnit: Int
    
    var dateTime: Date
    
    var heightInMetric: Float
    var heightInImperial: Float
    var weightInMetric: Float
    var weightInImperial: Float
    
    var bmiScore: Float
    var bmiClass: String
    
    init(name: String, gender: String, preferedUnit: Int, dateTime: Date, heightInMetric: Float, heightInImperial: Float, weightInMetric: Float, weightInImperial: Float, bmiScore: Float, bmiClass: String) {
        self.name = name
        self.gender = gender
        self.preferedUnit = preferedUnit
        self.dateTime = dateTime
        self.heightInMetric = heightInMetric
        self.heightInImperial = heightInImperial
        self.weightInMetric = weightInMetric
        self.weightInImperial = weightInImperial
        self.bmiScore = bmiScore
        self.bmiClass = bmiClass
    }
    
    func getStringForHeight() -> String{
        if(self.preferedUnit == BMIClalculator.METRIC){
            return(String(self.heightInMetric) + "m")
        }else{
            return(String(self.heightInImperial) + "ft")
        }
    }
    
    func getStringForWeight() -> String{
        if(self.preferedUnit == BMIClalculator.METRIC){
            return(String(Int(round(self.weightInMetric))) + "kg")
        }else{
            return(String(Int(round(self.weightInImperial))) + "lbs")
        }
    }

}
