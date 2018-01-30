//
//  countrySelectorController.swift
//  saloonMaster
//
//  Created by abdullah on 1/23/18.
//  Copyright © 2018 abdullah. All rights reserved.
//
/*
import UIKit

class countrySelectorController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var countryPickerView: UIPickerView!
    var countryValue : String!
    var countryValDelegate : AdminSignUPDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return country[row]
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return country.count
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            countryValue = country[row]
    }
    @IBAction func okButton(_ sender: UIButton) {
        if countryValue == nil {
            countryValue = country[0]
            countryValDelegate?.countryValuePicked(value: countryValue)
            dismiss(animated: true, completion: nil)
        }else{
            countryValDelegate?.countryValuePicked(value: countryValue)
            dismiss(animated: true, completion: nil)
        }
    }
}
*/
