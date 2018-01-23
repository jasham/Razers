//
//  appointmentViewController.swift
//  saloonMaster
//
//  Created by abdullah on 11/22/17.
//  Copyright © 2017 abdullah. All rights reserved.
//

import UIKit

class appointmentViewController: UIView {
    var k : Int = 50
    var timings:Dictionary<Double, Double> = Dictionary()
    // for i in 10
    // if am or pm
    
    func drawLines(){
        let line = UIBezierPath()
        for _ in 1...25 {
            line.move(to: CGPoint(x: 65, y: k))
            line.addLine(to: CGPoint(x: Int(bounds.maxX), y: k))
            line.lineWidth = 1
            UIColor.red.setStroke()
            line.stroke()
            k = k + 60
        }
    }
    
    func showExistingAppointment(){
        timings[6.5] = 6.45
        let drect = CGRect(x: 66, y: 65, width: Int(bounds.maxX) - 66, height: 25)
        let bpath : UIBezierPath = UIBezierPath(rect: drect)
        UIColor.blue.setFill()
        bpath.fill()
        
//      UIColor.blue.setFill()
        bpath.stroke()
    }
    override func draw(_ rect: CGRect) {
        drawLines()
        showExistingAppointment()
    }
}
