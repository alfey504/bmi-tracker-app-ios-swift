//
//  BmiDataSource.swift
//  BMI-Tracker-App
//
//  Created by Abraham Alfred Babu on 2022-12-13.
//

import Foundation

struct UserDefalutKeys{
    static let NAMES = "NAMES"
    static let GENDERS = "GENDER"
    static let PREFERED_UNITS = "PREFERED UNITS"
    static let HEIGHTS_IN_METRIC = "HEIGHTS_IN_METRIC"
    static let HEIGHTS_IN_IMPERIAL = "HEIGHTS_IN_IMPERIAL"
    static let WEIGHTS_IN_METRIC = "WEIGHTS_IN_METRIC"
    static let WEIGHTS_IN_IMPERIAL = "WEIGHTS_IN_IMPERIAL"
    static let BMI_SCORES = "BMI_SCORES"
    static let BMI_CLASSES = "BMI_CLASSES"
    static let DATE_TIMES = "DATE_TIMES"
    
}

class BmiDataSource {
    
    var dataSource: Array<BmiData>
    
    
    
    
    
    init(){
        self.dataSource = Array<BmiData>()
    }
    
    init(dataSource: Array<BmiData>) {
        self.dataSource = dataSource
    }
    
    func addDataToSource(data: BmiData){
        if(dataSource.isEmpty){
            dataSource.append(data)
        }else{
            dataSource.append(data)
        }
    }
    
    func getDataAt(at: Int) -> BmiData {
        return dataSource[at]
    }
    
    func size() -> Int{
        return dataSource.count
    }
    
    func saveData(){
        
        let userDefaults = UserDefaults.standard
        
        var names: Array<String> = []
        var genders: Array<String> = []
        
        var preferedUnits: Array<Int> = []
        var dateTimes: Array<Date> = []
        
        var heightsInMetric: Array<Float> = []
        var heightsInImperial: Array<Float> = []
        
        var weightsInMetric: Array<Float> = []
        var weightsInImperial: Array<Float> = []
            
        var bmiScores: Array<Float> = []
        var bmiClasses: Array<String> = []
        
        if(!dataSource.isEmpty){
            for i in 0...self.size()-1{
                names.append(dataSource[i].name)
                genders.append(dataSource[i].gender)
                preferedUnits.append(dataSource[i].preferedUnit)
                dateTimes.append(dataSource[i].dateTime)
                heightsInMetric.append(dataSource[i].heightInMetric)
                heightsInImperial.append(dataSource[i].heightInImperial)
                weightsInMetric.append(dataSource[i].weightInMetric)
                weightsInImperial.append(dataSource[i].weightInImperial)
                bmiScores.append(dataSource[i].bmiScore)
                bmiClasses.append(dataSource[i].bmiClass)
            }
        }
        
        userDefaults.set(names, forKey: UserDefalutKeys.NAMES)
        userDefaults.set(genders, forKey: UserDefalutKeys.GENDERS)
        userDefaults.set(preferedUnits, forKey: UserDefalutKeys.PREFERED_UNITS)
        userDefaults.set(dateTimes, forKey: UserDefalutKeys.DATE_TIMES)
        userDefaults.set(heightsInMetric, forKey: UserDefalutKeys.HEIGHTS_IN_METRIC)
        userDefaults.set(heightsInImperial, forKey: UserDefalutKeys.HEIGHTS_IN_IMPERIAL)
        userDefaults.set(weightsInMetric, forKey: UserDefalutKeys.WEIGHTS_IN_METRIC)
        userDefaults.set(weightsInImperial, forKey: UserDefalutKeys.WEIGHTS_IN_IMPERIAL)
        userDefaults.set(bmiScores, forKey: UserDefalutKeys.BMI_SCORES)
        userDefaults.set(bmiClasses, forKey: UserDefalutKeys.BMI_CLASSES)
    }
    
    func loadData() {
        
        var tempDataSource:Array<BmiData> = []
        
        let userDefaults = UserDefaults.standard
        let names = userDefaults.object(forKey: UserDefalutKeys.NAMES) as? [String] ?? []
        let genders = userDefaults.object(forKey: UserDefalutKeys.GENDERS) as? [String] ?? []
        let preferedUnits = userDefaults.object(forKey: UserDefalutKeys.PREFERED_UNITS) as? [Int] ?? []
        let dateTimes = userDefaults.object(forKey: UserDefalutKeys.DATE_TIMES) as? [Date] ?? []
        let heightsInMetric = userDefaults.object(forKey: UserDefalutKeys.HEIGHTS_IN_METRIC) as? [Float] ?? []
        let heightsInImperial = userDefaults.object(forKey: UserDefalutKeys.HEIGHTS_IN_IMPERIAL)  as? [Float] ?? []
        let weightsInMetric = userDefaults.object(forKey: UserDefalutKeys.WEIGHTS_IN_METRIC) as? [Float] ?? []
        let weightsInImperial = userDefaults.object(forKey: UserDefalutKeys.WEIGHTS_IN_IMPERIAL) as? [Float] ?? []
        let bmiScores = userDefaults.object(forKey: UserDefalutKeys.BMI_SCORES) as? [Float] ?? []
        let bmiClasses = userDefaults.object(forKey: UserDefalutKeys.BMI_CLASSES) as? [String] ?? []
        
        if(!names.isEmpty){
            
            for i in 0...names.count-1{
                let bmiData = BmiData(
                    name: names[i],
                    gender: genders[i],
                    preferedUnit: preferedUnits[i],
                    dateTime: dateTimes[i],
                    heightInMetric: heightsInMetric[i],
                    heightInImperial: heightsInImperial[i],
                    weightInMetric: weightsInMetric[i],
                    weightInImperial: weightsInImperial[i],
                    bmiScore: bmiScores[i],
                    bmiClass: bmiClasses[i]
                )
                tempDataSource.append(bmiData)
            }
            
            self.dataSource = tempDataSource
        }
    }
}
