//
//  BmiTableCell.swift
//  BMI-Tracker-App
//
//  Created by Abraham Alfred Babu on 2022-12-13.
//

import UIKit

class BmiTableCell: UITableViewCell {
    
    // identifier for the cell
    static let identifier = "bmiTableCell"
    
    // reference to the UIElements
    @IBOutlet weak var nameAndGenderLabel: UILabel!
    @IBOutlet weak var preferedUnitLabel: UILabel!
    @IBOutlet weak var dateTimeLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var bmiClassLabel: UILabel!
    
    // returns UINib for the table cell
    static func nib()->UINib{
        return UINib(nibName: "BmiTableCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // set background color on select
        let bgColorView = UIView()
        bgColorView.backgroundColor = .selectedBackGround
        self.selectedBackgroundView = bgColorView
    }
    
    // populates the cell with given data
    func populatTableCell(data: BmiData){
        nameAndGenderLabel.text = concatinateNameAndGender(name: data.name, gender: data.gender)
        preferedUnitLabel.text = (data.preferedUnit == BMIClalculator.METRIC) ? "METRIC" : "IMPERIAL"
        dateTimeLabel.text = data.dateTime.getStringForCell
        heightLabel.text = data.getStringForHeight()
        weightLabel.text = data.getStringForWeight()
        bmiLabel.text = String(data.bmiScore)
        bmiClassLabel.text = data.bmiClass
        bmiClassLabel.textColor = data.getColor()
    }
    
    // concatinate name and gender to give NAME.GENDER
    private func concatinateNameAndGender(name: String, gender: String) -> String{
        var finalName = name
        if(finalName.count > 12){
            finalName = finalName.compactify(cuttOff: 12)
        }
        return((finalName + " . " + gender).uppercased())
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
}
