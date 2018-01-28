//
//  adminSignUp.swift
//  saloonMaster
//
//  Created by abdullah on 1/23/18.
//  Copyright © 2018 abdullah. All rights reserved.
//

import UIKit

class adminSignUp: UIViewController {

    var cityValue : String!
    var countryValue : String!
    
    @IBOutlet weak var countryTextFeild: UITextField!
    @IBOutlet weak var addressTextFeild: UITextView!
    @IBOutlet weak var cityTextFeild: UITextField!
    @IBOutlet weak var emailIDTextFeild: UITextField!
    @IBOutlet weak var contactNoTextFeild: UITextField!
    @IBOutlet weak var nameTextFeild: UITextField!
    @IBOutlet weak var rePasswordTextFeild: UITextField!
    @IBOutlet weak var passwordTextFeild: UITextField!
    @IBOutlet weak var usernameTextFeild: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let passedCityValue = cityValue {
            cityTextFeild.text = passedCityValue
        }
        if let currentCountryValue = countryValue {
            countryTextFeild.text = currentCountryValue
        }
    }
    func alertMessage() {
        let alert = UIAlertController(title: "Error", message: "Enter the missing Feild", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {(action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert,animated: true,completion: nil)
    }

    @IBAction func cityPickerView(_ sender: UITextField) {
        self.performSegue(withIdentifier: "citySelectorView", sender: nil)
        
    }
    
    @IBAction func countryPickerView(_ sender: UITextField) {
        self.performSegue(withIdentifier: "countrySelectorView", sender: nil)
    }
    @IBAction func saveCheckOperationButton(_ sender: UIButton) {
        if usernameTextFeild.text! == "" || passwordTextFeild.text! == "" || rePasswordTextFeild.text! == "" || nameTextFeild.text! == "" || contactNoTextFeild.text! == "" || emailIDTextFeild.text! == "" || cityTextFeild.text! == "" || addressTextFeild.text! == "" || countryTextFeild.text! == "" {
            
            alertMessage()
        }
    }
 
}
