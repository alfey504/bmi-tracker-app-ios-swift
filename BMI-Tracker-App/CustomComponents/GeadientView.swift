//
//  GeadientView.swift
//  BMI-Tracker-App
//
//  Created by Abraham Alfred Babu on 2022-12-15.
//

import Foundation
import UIKit

@IBDesignable
class GradientView: UIView {
    @IBInspectable var firstColor: UIColor = UIColor.clear {
        didSet {
            updateView()
        }
    }
    @IBInspectable var secondColor: UIColor = UIColor.clear {
        didSet {
            updateView()
        }
    }
    
    override class var layerClass: AnyClass {
        get {
            return CAGradientLayer.self
        }
    }
    
    @IBInspectable var isHorizontal: Bool = true {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        let layer = self.layer as! CAGradientLayer
        layer.colors = [firstColor, secondColor].map{$0.cgColor}
        if (self.isHorizontal) {
            layer.startPoint = CGPoint(x: 0, y: 0.5)
            layer.endPoint = CGPoint (x: 1, y: 0.5)
        } else {
            layer.startPoint = CGPoint(x: 0.5, y: 0)
            layer.endPoint = CGPoint (x: 0.5, y: 1)
        }
    }
}