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
   
    var cityValue : String!
    
    @IBOutlet weak var cityPickerView: UIPickerView!
 
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
        return city[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        cityValue = city[row]
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let instanceOfAdminSignUp = segue.destination as? adminSignUp else { return }
        instanceOfAdminSignUp.cityValue = cityValue
    }
}
