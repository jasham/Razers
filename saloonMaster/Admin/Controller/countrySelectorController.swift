//
//  countrySelectorController.swift
//  saloonMaster
//
//  Created by abdullah on 1/23/18.
//  Copyright © 2018 abdullah. All rights reserved.
//

import UIKit

class countrySelectorController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    

    @IBOutlet weak var countryPickerView: UIPickerView!
    var country = ["India","Bangladesh","Nepal","Shrilanka","China"]
    var countryValue : String!
    
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard  let instanceOfAdminSignUp = segue.destination as? adminSignUp else {        return
        }
        instanceOfAdminSignUp.countryValue = countryValue
    }
    

}
