//
//  adminSignUp.swift
//  saloonMaster
//
//  Created by abdullah on 1/23/18.
//  Copyright © 2018 abdullah. All rights reserved.
//

import UIKit

class adminSignUp: UIViewController, UITextFieldDelegate,UIPickerViewDelegate, UIPickerViewDataSource, UITextViewDelegate {
    
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
        cityPickerView.delegate = self
        cityPickerView.dataSource = self
        cityTextFeild.inputView = cityPickerView
        
        countryPickerView.delegate = self
        countryPickerView.dataSource = self
        countryTextFeild.inputView = countryPickerView
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            addressTextFeild.resignFirstResponder()
        }
        return true
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
    
    // If citypickerview or countrypickerview is trigerred than this will help textfeild to get data
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
    
    
    
    // Alert message which will pop up when user types anything irrelavant to textfields
    func alertMessage(err: String, message: String) {
        let alert = UIAlertController(title: err, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {(action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert,animated: true,completion: nil)
    }
    
    // Validating username field is not greater than 30 while user is typing
    @IBAction func usernameAtRunTimeValidation(_ sender: UITextField) {
        if let usernameAtRunTimeValue = sender.text {
            if usernameAtRunTimeValue.count >= 30 {
                self.alertMessage(err: "Error", message: "Charachters limit exceded max limit is 30")
            }
        }
    }
    
    // Validating the username textfield from taking correct input
  /*  @IBAction func isValidInput(_ sender: UITextField) {
        //_ = usernameValidatingWhenSubmit()
    }*/
    
    // Validating username when submit button is pressed
    func usernameValidatingWhenSubmit() -> Bool {
        if let username = usernameTextFeild.text{
            let RegEx = "[A-Z0-9a-z_]{0,30}"
            if username.rangeOfCharacter(from: .whitespaces) == nil {
                let Test = NSPredicate(format:"SELF MATCHES %@", RegEx)
                if !Test.evaluate(with: username) {
                    self.alertMessage(err: "Error", message: "Special charachters not allowed except underscore or charachters are less than 7.")
                    return false
                }
            }else{
               self.alertMessage(err: "Error", message: "Whitespace not accepted for username")
               return false
            }
        }
        return true
    }
    
    // When return is pressed from keyboard, resign from first responder
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTextFeild {
            usernameTextFeild.resignFirstResponder()
        }else if textField == passwordTextFeild {
            passwordTextFeild.resignFirstResponder()
        }else if textField == addressTextFeild {
            addressTextFeild.resignFirstResponder()
        }else if textField == emailIDTextFeild {
            emailIDTextFeild.resignFirstResponder()
        }else if textField == contactNoTextFeild {
            contactNoTextFeild.resignFirstResponder()
        }else if textField == nameTextFeild {
            nameTextFeild.resignFirstResponder()
        }else if textField == rePasswordTextFeild {
            rePasswordTextFeild.resignFirstResponder()
        }
        return true
    }
    
    // Validating textfields length if greater than 30 it will through error
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var valType: Bool = true
        if textField == contactNoTextFeild {
            valType = (textField.text?.count ?? 0) < 10 || string == ""
            if valType == false {
                self.alertMessage(err: "Error", message: "Charachters limit exceded max limit is 10")
            }
        }else {
            valType = (textField.text?.count ?? 0) < 30 || string == ""
            if valType == false {
                self.alertMessage(err: "Error", message: "Charachters limit exceded max limit is 30")
            }
        }
        return valType
    }
    
    // Validating re-enter password when submit button is pressed
    func rePasswordValidatingWhenSubmit() -> Bool {
        if !(passwordTextFeild.text?.isEmpty)! {
            let password = passwordTextFeild.text
            if let rePassword = rePasswordTextFeild.text {
                if !(rePassword.isEmpty) {
                    if !(password == rePassword) {
                        self.alertMessage(err: "Error", message: "Password didn't match")
                        return false
                    }
                }else{
                    self.alertMessage(err: "Error", message: "Please enter re-entered password")
                    return false
                }
            }
        }else{
            self.alertMessage(err: "Error", message: "Please enter password first")
            return false
        }
        return true
    }
    
    // Validating nameTextField
    @IBAction func validatingNameTextFieldValues(_ sender: UITextField) {
        _ = validatingNameWhenSubmit()
    }
    
    // Validating name field when submit button is pressed
    func validatingNameWhenSubmit() -> Bool {
        if let name = nameTextFeild.text {
            let regex = "[A-Za-z]{0,30}"
            let verifiedName = NSPredicate(format:"SELF MATCHES %@", regex)
            if !verifiedName.evaluate(with: name) {
                self.alertMessage(err: "Error", message: "Name text field should contain only alphabatical charachters")
                return false
            }
        }
        return true
    }
    
    //Validating contactTextField
    @IBAction func validatingContactTextFieldValues(_ sender: UITextField) {
        if let contactNo = contactNoTextFeild.text {
            _ = validatingContactWhenSubmit(contactNo : contactNo)
        }
    
    }
    
    // Validating contact no when submit pressed
    func validatingContactWhenSubmit(contactNo: String) -> Bool {
        let regex = "[0-9]{0,10}"
        let verifiedName = NSPredicate(format:"SELF MATCHES %@", regex)
        if !verifiedName.evaluate(with: contactNo) {
            self.alertMessage(err: "Error", message: "Please enter 10 digit contact number only")
            return false
        }
        return true
    }
    
    // Validating email
    /*@IBAction func validatingEmailID(_ sender: UITextField) {
        if let emailValue = sender.text {
            _ = validatingEmailWhenSubmit(emailValue: emailValue)
        }
    }*/
    
    
    // Validating email when submit button pressed
    func validatingEmailWhenSubmit(emailValue: String) -> Bool {
        let regex = "[A-Za-z0-9_.]+@[A-Za-z0-9]+\\.[a-zA-Z]{2,6}]{0,}"
        let emailTestValue = NSPredicate(format: "SELF MATCHES %@", regex)
        if !emailTestValue.evaluate(with: emailValue) {
            self.alertMessage(err: "Error", message: "Please enter correct email")
            return false
        }
        return true
    }
    
    // Validating text view after editing
    func textViewDidEndEditing(_ textView: UITextView) {
        _ = addressTextViewValidating()
    }
    
    // Validating address text view when submit
    func addressTextViewValidating() -> Bool {
        if (addressTextFeild.text) != nil {
            let regex = "[A-Za-z0-9./#@]{0,}"
            let addressValue = addressTextFeild.text
            let addressEvaluatedValue = NSPredicate(format: "SELF MATCHES %@", regex)
            if addressEvaluatedValue.evaluate(with: addressValue) != true {
                self.alertMessage(err: "Error", message: "Please use correct charachters")
                return false
            }
        }
        return true
    }
    
    // Validating textfields are emplty or not
    func viewsValidation() -> Bool {
        if usernameTextFeild.text! == "" || passwordTextFeild.text! == "" || rePasswordTextFeild.text! == "" || nameTextFeild.text! == "" || contactNoTextFeild.text! == "" || emailIDTextFeild.text! == "" || cityTextFeild.text! == "" || addressTextFeild.text! == "" || countryTextFeild.text! == "" {
            alertMessage(err: "Error",message: "Fields are empty !!!")
            return false
        }else if usernameValidatingWhenSubmit() == false {
            return false
        }else if rePasswordValidatingWhenSubmit() == false {
            return false
        }else if validatingNameWhenSubmit() == false {
            return false
        }else if validatingContactWhenSubmit(contactNo: contactNoTextFeild.text!) == false {
            return false
        }else if validatingEmailWhenSubmit(emailValue: emailIDTextFeild.text!) == false {
            return false
        }else if addressTextViewValidating() == false {
            return false
        }
        return true
    }
    
    // This function will take care of saving data to firebase and core datadatabase
    @IBAction func saveCheckOperationButton(_ sender: UIButton) {
        if viewsValidation() == false {
            alertMessage(err: "Error", message: "Please enter correct values")
        }
    }
    
    // Dismiss city and country
   

}
