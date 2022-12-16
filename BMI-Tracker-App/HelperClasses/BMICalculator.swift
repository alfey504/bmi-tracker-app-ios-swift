//
//  BMICalculator.swift
//  BMI-Tracker-App
//
//  Created by Abraham Alfred Babu on 2022-12-13.
//

import Foundation
import UIKit

struct BmiClass{
    static let SEVERE_THINESS = "SEVERE THINNESS"
    static let MODEREATE_THINNESS = "MODEREATE THINNESS"
    static let MILD_THINNESS = "MILD THINNESS"
    static let NORMAL = "NORMAL"
    static let OVERWEIGHT = "OVERWEIGHT"
    static let OBESE_CLASS_I = "OBESE CLASS I"
    static let OBESE_CLASS_II = "OBESE CLASS II"
    static let OBESE_CLASS_III = "OBESE CLASS III"
}

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
            self.bmiClass = BmiClass.SEVERE_THINESS
        }else if(self.bmi! < 17){
            self.bmiClass = BmiClass.MODEREATE_THINNESS
        }else if(self.bmi! < 18.5){
            self.bmiClass = BmiClass.MILD_THINNESS
        }else if(self.bmi! < 25){
            self.bmiClass = BmiClass.NORMAL
        }else if(self.bmi! < 30){
            self.bmiClass = BmiClass.OVERWEIGHT
        }else if(self.bmi! < 35){
            self.bmiClass = BmiClass.OBESE_CLASS_I
        }else if(self.bmi! < 40){
            self.bmiClass = BmiClass.OBESE_CLASS_II
        }else if(self.bmi! > 40){
            self.bmiClass = BmiClass.OBESE_CLASS_III
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
        self.heightInImperial = self.heightInMetric! * 3.281
        self.weightInImperial = self.weightInMetric! / 0.45359237
    }
    
    
    func calculateMetricFromImperial(){
        self.heightInMetric = self.heightInImperial! / 3.281
        self.weightInMetric = self.weightInImperial! * 0.45359237
    }
    
    func getColor() -> UIColor{
        if(bmiClass == BmiClass.NORMAL){
            return .safeGreen
        }
        
        if([BmiClass.OVERWEIGHT, BmiClass.MODEREATE_THINNESS].contains(bmiClass)){
            return .dangerYellow
        }
        
        if([BmiClass.SEVERE_THINESS, BmiClass.OBESE_CLASS_I, BmiClass.OBESE_CLASS_II, BmiClass.OBESE_CLASS_III].contains(bmiClass)){
            return .dangerRed
        }
        return .red
    }
    
    static func findColor(bmiClass: String) -> UIColor{
        if(bmiClass == BmiClass.NORMAL){
            return .safeGreen
        }
        
        if([BmiClass.OVERWEIGHT, BmiClass.MODEREATE_THINNESS].contains(bmiClass)){
            return .dangerYellow
        }
        
        if([BmiClass.SEVERE_THINESS, BmiClass.OBESE_CLASS_I, BmiClass.OBESE_CLASS_II, BmiClass.OBESE_CLASS_III].contains(bmiClass)){
            return .dangerRed
        }
        
        return .red
    }
}
