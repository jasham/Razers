//
//  adminSignUp.swift
//  saloonMaster
//
//  Created by abdullah on 1/23/18.
//  Copyright © 2018 abdullah. All rights reserved.
//

import UIKit

class adminSignUp: UIViewController, UITextFieldDelegate,UIPickerViewDelegate, UIPickerViewDataSource {
    
    var cityValue : String!
    var countryValue : String!
    
    let usernameRegEx = "[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}"
    
    let cityPickerView = UIPickerView()
    let countryPickerView = UIPickerView()
    
    @IBOutlet weak var countryTextFeild: UITextField!
    @IBOutlet weak var addressTextFeild: UITextView!
    @IBOutlet weak var cityTextFeild: UITextField!
    @IBOutlet weak var emailIDTextFeild: UITextField!
    @IBOutlet weak var contactNoTextFeild: UITextField!
    @IBOutlet weak var nameTextFeild: UITextField!
    @IBOutlet weak var rePasswordTextFeild: UITextField!
    @IBOutlet weak var passwordTextFeild: UITextField!
    @IBOutlet weak var usernameTextFeild: UITextField!
    
    let cityValues = ["Bhopal","Bombay","Bangalore","Jharkhand","Kashmir","Jabalpur"]
    let countryValues = ["India","Bangladesh","Nepal","Shrilanka","China"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        usernameTextFeild.delegate = self
        
        cityPickerView.delegate = self
        cityPickerView.dataSource = self
        cityTextFeild.inputView = cityPickerView
        
        countryPickerView.delegate = self
        countryPickerView.dataSource = self
        countryTextFeild.inputView = countryPickerView
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == cityPickerView {
            return cityValues.count
        }else{
            return countryValues.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == cityPickerView {
            return cityValues[row]
        }else{
            return countryValues[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == cityPickerView {
            if cityValues[row] == "" {
                cityValue = cityValues[0]
                cityTextFeild.text = cityValue
            }else{
                cityValue = cityValues[row]
                cityTextFeild.text = cityValue
            }
            cityTextFeild.resignFirstResponder()
        }else{
            if countryValues[row] == "" {
                countryValue = countryValues[0]
                countryTextFeild.text = countryValue
            }else{
                countryValue = countryValues[row]
                countryTextFeild.text = countryValue
            }
            countryTextFeild.resignFirstResponder()
        }
    }

    @IBAction func saveCheckOperationButton(_ sender: UIButton) {
        
    }
    
    func alertMessage(err: String, message: String) {
        let alert = UIAlertController(title: err, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {(action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert,animated: true,completion: nil)
    }
    
    @IBAction func usernameAtRunTimeValidation(_ sender: UITextField) {
        if let usernameAtRunTimeValue = sender.text {
            if usernameAtRunTimeValue.count >= 30 {
                self.alertMessage(err: "Error", message: "Charachters limit exceded max limit is 30")
            }
        }
    }
    @IBAction func isValidInput(_ sender: UITextField) {
        let RegEx = "\\A\\w{7,18}\\z"
        let Test = NSPredicate(format:"SELF MATCHES %@", RegEx)
        if !Test.evaluate(with: sender.text) {
            self.alertMessage(err: "Error", message: "Special charachters not allowed except underscore.")
        }
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let valType = (textField.text?.count ?? 0) < 30 || string == ""
        if valType == false {
            self.alertMessage(err: "Error", message: "Charachters limit exceded max limit is 30")
        }
        return valType
    }
    func viewsValidation(){
        if usernameTextFeild.text! == "" || passwordTextFeild.text! == "" || rePasswordTextFeild.text! == "" || nameTextFeild.text! == "" || contactNoTextFeild.text! == "" || emailIDTextFeild.text! == "" || cityTextFeild.text! == "" || addressTextFeild.text! == "" || countryTextFeild.text! == "" {
            alertMessage(err: "Error",message: "Fields are empty !!!")
        }
    }
}

