//
//  RadioGroup.swift
//  BMI-Tracker-App
//
//  Created by Abraham Alfred Babu on 2022-12-12.
//

import Foundation
import UIKit

class RadioGroup{

    var radioButtons: Array<RadioButton>
    
    init(){
        radioButtons = Array<RadioButton>()
    }
    
    func addButtonToGroup(button: RadioButton){
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_ :)))
        button.buttonArea.addGestureRecognizer(tapRecognizer)
        radioButtons.append(button)
    }
    
    func setButtonSelected(button: UIView){
        print("wassup")
        for radioButton in radioButtons{
            if(radioButton.compareButton(button: button)){
                radioButton.setButtonSelected(selected: true)
            }else{
                radioButton.setButtonSelected(selected: false)
            }
        }
    }
    
    func isSelected() -> Bool {
        for radioButton in radioButtons {
            if(radioButton.buttonSelected){
                return true
            }
        }
        return false
    }
    
    func getSelected() -> RadioButton?{
        for radioButton in radioButtons {
            if(radioButton.buttonSelected){
                return radioButton
            }
        }
        return nil
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer){
        let sourceView = sender.view! as UIView
        self.setButtonSelected(button: sourceView)
    }
}
