//
//  BmiListViewController.swift
//  BMI-Tracker-App
//
//  Created by Abraham Alfred Babu on 2022-12-13.
//

import UIKit

class BmiListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var bmiTableView: UITableView!
    
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
    
    

}
