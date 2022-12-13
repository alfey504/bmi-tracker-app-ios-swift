//
//  BMICalculator.swift
//  BMI-Tracker-App
//
//  Created by Abraham Alfred Babu on 2022-12-13.
//

import Foundation

class BMIClalculator{
    
    static let METRIC = 1
    static let IMPERIAL = 2
    
    var heightInMetric: Float?
    var weightInMetric: Float?
    
    var heightInImperial: Float?
    var weightInImperial: Float?
    
    let preferedUnitType: Int
    
    var bmi: Float?
    var bmiClass: String?
    
    init(height: Float, weight: Float, preferedUnitType: Int) {
        
        self.preferedUnitType = preferedUnitType
        if(self.preferedUnitType == BMIClalculator.METRIC){
            self.heightInMetric = height
            self.weightInMetric = weight
            self.calculateImperialFromMetric()
        }else if(preferedUnitType == BMIClalculator.IMPERIAL){
            self.heightInImperial = height
            self.weightInImperial = weight
            self.calculateMetricFromImperial()
        }
    }
    
    func getBmi() -> Float{
        let bmi = self.weightInMetric! / (self.heightInMetric! * self.heightInMetric!)
        self.bmi = round(bmi * 10) / 10
        self.calculateBmiClass()
        return self.bmi!
    }
    
    private func calculateBmiClass(){
        if(self.bmi! < 16){
            self.bmiClass = "SEVERE THINNESS"
        }else if(self.bmi! < 17){
            self.bmiClass = "MODEREATE THINNESS"
        }else if(self.bmi! < 18.5){
            self.bmiClass = "MILD THINNESS"
        }else if(self.bmi! < 25){
            self.bmiClass = "NORMAL"
        }else if(self.bmi! < 30){
            self.bmiClass = "OVERWEIGHT"
        }else if(self.bmi! < 35){
            self.bmiClass = "OBESE CLASS I"
        }else if(self.bmi! < 40){
            self.bmiClass = "OBESE CLASS II"
        }else if(self.bmi! > 40){
            self.bmiClass = "OBESE CLASS III"
        }
    }
    
    func getBmiClass() -> String {
        return self.bmiClass!
    }
    
    static func bmiPercent(bmi: Float) -> Float {
        let percent = (bmi - 10.0) / (50.0 - 10.0)
        if(percent < 0){
            return 0
        }else if(percent > 1){
            return 1
        }
        return percent
    }
    
    func calculateImperialFromMetric() {
        self.heightInImperial = self.heightInMetric! * 3.28
        self.weightInImperial = self.weightInMetric! / 0.45
    }
    
    
    func calculateMetricFromImperial(){
        self.heightInMetric = self.heightInImperial! / 3.28
        self.weightInMetric = self.weightInImperial! * 0.45
    }
}
