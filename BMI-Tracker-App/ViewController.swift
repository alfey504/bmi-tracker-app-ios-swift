//
//  ViewController.swift
//  BMI-Tracker-App
//
//  Created by Abraham Alfred Babu on 2022-12-12.
//  Student id  : 301270598
//
//  Desciprtion
//  _________________________________________________
//  A simple app that lets you calculate your bmi and
//  save it for later viewing and tracking purpose. It
//  also allows you to edit and delete previous entries

import UIKit

class ViewController: UIViewController {
    
    // creating references for the UI Elements
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var toggleMetricOrImplerialSwitch: UISwitch!
    
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    
    @IBOutlet weak var genderSelectMaleButton: UIView!
    @IBOutlet weak var genderSelectFemaleButton: UIView!
    @IBOutlet weak var genderSelectOtherButton: UIView!
    
    @IBOutlet weak var unitLabel: UILabel!
    
    @IBOutlet weak var bmiLabel: UITextField!
    @IBOutlet weak var bmiClassLabel: UILabel!
    
    @IBOutlet weak var bmiProgressBar: UIProgressView!
    
    @IBOutlet weak var resultCard: UIView!
    
    var genderSelectRadioGroup: RadioGroup!
    var bmiCalculator: BMIClalculator!
    
    var bmiDataSource: BmiDataSource? = BmiDataSource()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        toggleMetricOrImplerialSwitch.set(width: 30, height: 18)
        
        bmiDataSource!.loadData()
        
        makeRadioButton()
    }
    
    // add all the radio buttonViews to Radio Group Custom Class
    private func makeRadioButton(){
        genderSelectRadioGroup = RadioGroup()
        let genderSelectMaleRadioButton = RadioButton(buttonView: genderSelectMaleButton, buttonSelected: false)
        let genderSelectFemaleRadioButton = RadioButton(buttonView: genderSelectFemaleButton, buttonSelected: false)
        let genderSelectOtherRadioButton = RadioButton(buttonView: genderSelectOtherButton, buttonSelected: false)
        genderSelectRadioGroup.addButtonToGroup(button: genderSelectMaleRadioButton)
        genderSelectRadioGroup.addButtonToGroup(button: genderSelectFemaleRadioButton)
        genderSelectRadioGroup.addButtonToGroup(button: genderSelectOtherRadioButton)
    }
    
    
    // set the status bar to white
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNeedsStatusBarAppearanceUpdate()
        bmiDataSource!.loadData()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    // handle control button on height input
    @IBAction func heighControlButtonsPressed(_ sender: UIButton) {
        var newHeight: Float = 0
        if(sender.tag == 2){
            if(heightTextField.text == ""){
                newHeight = 0.1
            }else{
                newHeight = Float(heightTextField.text!) ?? 0
                newHeight = round((newHeight + 0.1) * 10)/10;
            }
        }else if(sender.tag == 1){
            if(heightTextField.text == ""){
                newHeight = 0
            }else{
                newHeight = Float(heightTextField.text!) ?? 0
                if(newHeight != 0){
                    newHeight = round((newHeight - 0.1) * 10)/10;
                }
            }
        }
        heightTextField.text? = String(newHeight)
    }
    
    // handle control button on weight input
    @IBAction func weightControlButtonPresses(_ sender: UIButton) {
        
        var newWeight: Int = 0
        if(sender.tag == 2){
            if(weightTextField.text == ""){
                newWeight = 1
            }else{
                newWeight = Int(weightTextField.text!) ?? 0
                newWeight+=1;
            }
        }else if(sender.tag == 1){
            if(weightTextField.text == ""){
                newWeight = 0
            }else{
                newWeight = Int(weightTextField.text!) ?? 0
                if(newWeight != 0){
                    newWeight-=1;
                }
            }
        }
        weightTextField.text? = String(newWeight)
    }
    
    // handle unit change on UI switch
    @IBAction func unitChanged(_ sender: UISwitch) {
        if(sender.isOn){
            unitLabel.text = "METRIC"
            heightTextField.placeholder = "m"
            weightTextField.placeholder = "Kg"
        }else{
            unitLabel.text = "IMPERIAL"
            heightTextField.placeholder = "ft"
            weightTextField.placeholder = "lbs"
        }
    }
    
    
    // when calculate button is pressed
    @IBAction func calculateButtonPressed(_ sender: Any) {
        if(calculateBmi()){
            resultCard.isHidden = false
        }
    }
    
    // calculates the bmi and returns true if successfuls
    private func calculateBmi() -> Bool {
        if(evaluateFields()){
            let height = Float(heightTextField.text!)
            let weight = Float(weightTextField.text!)
            
            let preferedUnit  = (toggleMetricOrImplerialSwitch.isOn) ? BMIClalculator.METRIC : BMIClalculator.IMPERIAL
            
           
            bmiCalculator = BMIClalculator(height: height!, weight: weight!, preferedUnitType: preferedUnit)
            let bmi = bmiCalculator.getBmi()
            bmiLabel.text = String(bmi)
            bmiClassLabel.text = bmiCalculator.getBmiClass()
            bmiProgressBar.progress = BMIClalculator.bmiPercent(bmi: bmi)
            bmiProgressBar.progressTintColor = bmiCalculator.getColor()
            
            return true
        }
        
        return false
    }
    
    // evaluate all the input fields
    private func evaluateFields() -> Bool{
        
        if(nameTextField.text == ""){
            makeAlertWithOkButton(message: "Please enter a name", view: nameTextField)
            return false
        }
        
        if(heightTextField.text == "" || heightTextField.text?.isNumber == false){
            makeAlertWithOkButton(message: "Please enter a valid height", view: heightTextField)
            return false
        }
        
        if(weightTextField.text == "" || weightTextField.text?.isNumber == false){
            makeAlertWithOkButton(message: "Please enter a valid weight", view: heightTextField)
            return false
        }
        
        if(!genderSelectRadioGroup.isSelected()){
            makeAlertWithOkButton(message: "PLease select your gender", view: nil)
            return false
        }
        
        return true
    }
    
    // show a UIAlertBox with given message and an OK button
    private func makeAlertWithOkButton(message: String, view: UIView?){
        let dialogMessage = UIAlertController(title: "Issues", message: message, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            if(view != nil){
                view?.becomeFirstResponder()
            }
         })
        
        dialogMessage.addAction(ok)
        self.present(dialogMessage, animated: true, completion: nil)
    }
    
    // returns an instance of BmiData with data from data fields
    private func makeBmiData() -> BmiData{
        let name = nameTextField.text!
        let gender = genderSelectRadioGroup.getSelected()!.text
        
        let bmiData = BmiData(
            name: name,
            gender: gender!,
            preferedUnit: bmiCalculator.preferedUnitType,
            dateTime: Date(),
            heightInMetric: bmiCalculator.heightInMetric!,
            heightInImperial: bmiCalculator.heightInImperial!,
            weightInMetric: bmiCalculator.weightInMetric!,
            weightInImperial: bmiCalculator.weightInImperial!,
            bmiScore: bmiCalculator.bmi!,
            bmiClass: bmiCalculator.bmiClass!
        )
        return bmiData
    }
    
    // saves the data and segue to Bmi list screen
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        if(calculateBmi()){
            resultCard.isHidden = false
            let bmiData = makeBmiData()
            bmiDataSource!.addDataToSource(data: bmiData)
            bmiDataSource!.saveData()
            addBadgeToHistoryItemInTabBar()
        }
    }
    
    // adds a badge to Bmi List page item (not necessary for learning purpose)
    func addBadgeToHistoryItemInTabBar(){
        let tabBar = self.tabBarController!.tabBar
        let historyItem = tabBar.items![1]
        historyItem.badgeColor = .red
        historyItem.badgeValue = "1"
        self.tabBarController!.selectedIndex = 1
    }

    
}

