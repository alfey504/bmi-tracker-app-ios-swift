//
//  BmiListViewController.swift
//  BMI-Tracker-App
//
//  Created by Abraham Alfred Babu on 2022-12-13.
//

import UIKit

class BmiListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var bmiTableView: UITableView!
    @IBOutlet weak var nameGenderLabel: UILabel!
    @IBOutlet weak var dateTImeLabel: UILabel!
    @IBOutlet weak var unitLabel: UILabel!
    @IBOutlet weak var heigtLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var bmiClassLabel: UILabel!
    
    
    var bmiDataSource: BmiDataSource = BmiDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bmiTableView.delegate = self
        bmiTableView.dataSource = self
        
        bmiDataSource.loadData()
        
        bmiTableView.register(BmiTableCell.nib(), forCellReuseIdentifier: BmiTableCell.identifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNeedsStatusBarAppearanceUpdate()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bmiDataSource.size()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 135
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BmiTableCell.identifier, for: indexPath) as! BmiTableCell
        cell.populatTableCell(data: bmiDataSource.getDataAt(at: indexPath.row))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = bmiDataSource.getDataAt(at: indexPath.row)
        nameGenderLabel.text = concatinateNameAndGender(name: data.name, gender: data.gender)
        unitLabel.text = (data.preferedUnit == BMIClalculator.METRIC) ? "METRIC" : "IMPERIAL"
        heigtLabel.text = data.getStringForHeight()
        weightLabel.text = data.getStringForWeight()
        bmiLabel.text = String(data.bmiScore)
        bmiClassLabel.text = data.bmiClass
    }
    
    private func concatinateNameAndGender(name: String, gender: String) -> String{
        return((name + " . " + gender).uppercased())
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteItem = UIContextualAction(style: .normal, title:  "", handler: {
            (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            print("swiped left sad T_T")
            self.bmiDataSource.deleteAt(at: indexPath.row)
            self.bmiDataSource.saveData()
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            success(true)
        })
        
        deleteItem.backgroundColor = .red
        deleteItem.image = UIImage(systemName: "trash")
        return(UISwipeActionsConfiguration(actions: [deleteItem]))
    }
}
