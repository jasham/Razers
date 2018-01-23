//
//  appointmentCalendar.swift
//  saloonMaster
//
//  Created by abdullah on 11/17/17.
//  Copyright © 2017 abdullah. All rights reserved.
//

import UIKit
import EventKit

class appointmentCalendar: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
 //      eventButtonSetup()
    }
    @IBAction func appointmentFunc(_ sender: UIButton) {
        
    }
    /*
    func eventButtonSetup() {
        let addEventButton = UIButton(frame: CGRect(x : 20,y : 0, width : 30, height: 30))
        addEventButton.setTitle("Take Appointment", for: .normal)
        addEventButton.setTitleColor(UIColor.blue, for: .normal)
        // addEventButton.actions(forTarget: eventButton(_:), forControlEvent: UIButton)
        addEventButton.addTarget(self, action: #selector(eventButton(_:)), for: UIControlEvents.touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView : addEventButton)
    }
    @objc func eventButton(_ sender : UIButton!) {
        let nextPage: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = nextPage.instantiateViewController(withIdentifier: "appointmentScene")
        self.present(newViewController, animated: true, completion: nil)
    }*/
}
