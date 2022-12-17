//
//  RadioGroup.swift
//  BMI-Tracker-App
//
//  Created by Abraham Alfred Babu on 2022-12-12.
//

import Foundation
import UIKit

// Class to handle muliple radioButtons
class RadioGroup{
    
    var radioButtons: Array<RadioButton>
    
    // constructor
    init(){
        radioButtons = Array<RadioButton>()
    }
    
    // add the given button to a RadioGroup
    func addButtonToGroup(button: RadioButton){
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_ :)))
        button.buttonArea.addGestureRecognizer(tapRecognizer)
        radioButtons.append(button)
    }
    
    // set the given UIView as the selected button
    func setButtonSelected(button: UIView){
        for radioButton in radioButtons{
            if(radioButton.compareButton(button: button)){
                radioButton.setButtonSelected(selected: true)
            }else{
                radioButton.setButtonSelected(selected: false)
            }
        }
    }
    
    // check if any of the radio button is selected
    func isSelected() -> Bool {
        for radioButton in radioButtons {
            if(radioButton.buttonSelected){
                return true
            }
        }
        return false
    }
    
    // returns the slected radio button
    func getSelected() -> RadioButton?{
        for radioButton in radioButtons {
            if(radioButton.buttonSelected){
                return radioButton
            }
        }
        return nil
    }
    
    // handles tap on a radio button
    @objc func handleTap(_ sender: UITapGestureRecognizer){
        let sourceView = sender.view! as UIView
        self.setButtonSelected(button: sourceView)
    }
}
