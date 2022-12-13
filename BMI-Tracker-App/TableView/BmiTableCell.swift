//
//  BmiTableCell.swift
//  BMI-Tracker-App
//
//  Created by Abraham Alfred Babu on 2022-12-13.
//

import UIKit

class BmiTableCell: UITableViewCell {
    
    static let identifier = "bmiTableCell"
    
    @IBOutlet weak var nameAndGenderLabel: UILabel!
    @IBOutlet weak var preferedUnitLabel: UILabel!
    @IBOutlet weak var dateTimeLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var bmiClassLabel: UILabel!
    
    static func nib()->UINib{
        return UINib(nibName: "BmiTableCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func populatTableCell(data: BmiData){
        nameAndGenderLabel.text = concatinateNameAndGender(name: data.name, gender: data.gender)
        preferedUnitLabel.text = (data.preferedUnit == BMIClalculator.METRIC) ? "METRIC" : "IMPERIAL"
        dateTimeLabel.text = data.dateTime.getStringForCell
        heightLabel.text = data.getStringForHeight()
        weightLabel.text = data.getStringForWeight()
        bmiLabel.text = String(data.bmiScore)
        bmiClassLabel.text = data.bmiClass
    }
    
    private func concatinateNameAndGender(name: String, gender: String) -> String{
        return((name + " . " + gender).uppercased())
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
