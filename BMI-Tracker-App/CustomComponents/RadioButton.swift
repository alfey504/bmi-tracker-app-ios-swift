//
//  RadioButton.swift
//  BMI-Tracker-App
//
//  Created by Abraham Alfred Babu on 2022-12-12.
//

import Foundation
import UIKit

class RadioButton{
    
    var buttonSelected: Bool
    var buttonArea: UIView
    private var button: UIButton?
    var text: String?
    
    init(buttonView:UIView, buttonSelected: Bool){
        self.buttonSelected = buttonSelected
        self.buttonArea = buttonView
        for child in self.buttonArea.subviews{
            if(child is UIButton){
                self.button = child as? UIButton
            }
            if(child is UILabel){
                let label = child as? UILabel
                self.text = label?.text
            }
        }
        self.updateButton()
    }
    
    func setButtonSelected(selected: Bool){
        self.buttonSelected = selected
        self.updateButton()
    }
    
    func updateButton(){
        self.button?.setSelected(selected: self.buttonSelected)
    }
    
    func compareButton(button: UIView) -> Bool{
        print(button.tag)
        if(button == self.buttonArea){
            return true
        }else{
            return false
        }
    }
}
