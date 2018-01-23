//
//  adminLoginScreen.swift
//  saloonMaster
//
//  Created by abdullah on 1/16/18.
//  Copyright © 2018 abdullah. All rights reserved.
//

import UIKit
import FirebaseAuth

class adminLoginScreen: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var username: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        username.delegate = self
        password.delegate = self
        // Do any additional setup after loading the view.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.username.resignFirstResponder()
        self.password.resignFirstResponder()
    }
   
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.username.resignFirstResponder()
        self.password.resignFirstResponder()
        return true
    }
    func alertMessageWhenEmpty(){
        let alert = UIAlertController(title: "Error ", message: "Username or Password is empty", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
                alert.dismiss(animated: true, completion: nil)
            }))
        self.present(alert,animated: true,completion: nil)
    }
    
    @IBAction func loginAction(_ sender: UIButton) {
        if (password.text == "" || username.text == ""){
                alertMessageWhenEmpty()
        }else{
            Auth.auth().signIn(withEmail: username!.text!, password: password!.text!, completion: { (user, error) in
                if user != nil {
                    self.performSegue(withIdentifier: "adminOperationWindow", sender: self)
                }else{
                    if let myerror = error?.localizedDescription {
                        print(myerror)
                    }else{
                        print("Error")
                    }
                }
            })
            
        }
    }
}

