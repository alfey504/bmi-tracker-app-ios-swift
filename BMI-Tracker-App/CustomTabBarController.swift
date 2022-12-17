//
//  BmiListViewController.swift
//  BMI-Tracker-App
//
//  Created by Abraham Alfred Babu on 2022-12-13.
//  Student id  : 301270598
//
//  Desciprtion
//  _________________________________________________
//  A simple app that lets you calculate your bmi and
//  save it for later viewing and tracking purpose. It
//  also allows you to edit and delete previous entries


import UIKit

class CustomTabBarController: UITabBarController {
    
    // which view to show on load
    @IBInspectable var initailIndex: Int = 0
    
    // to know if coming from edit screen
    var comingFromEditScreen: Bool? = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.backgroundColor = .clear
        
        // set the selectedIndex as intial index
        selectedIndex = initailIndex
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // go to bmi list view if comming from Edit Page
        if(comingFromEditScreen == true){
            self.selectedIndex = 1
        }
    }

    
}
