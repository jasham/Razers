//
//  citySelectorController.swift
//  saloonMaster
//
//  Created by abdullah on 1/23/18.
//  Copyright © 2018 abdullah. All rights reserved.
//

import UIKit

class citySelectorController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let city = ["Bhopal","Bombay","Bangalore","Jharkhand","Kashmir","Jabalpur"]
    @IBOutlet weak var cityPickerView: UIPickerView!
    var cityValue : String?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return city.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        cityValue = city[row]
        return city[row]
    }
    
}
