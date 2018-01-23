//
//  ViewController.swift
//  saloonMaster
//
//  Created by abdullah on 11/4/17.
//  Copyright © 2017 abdullah. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
   
    @IBOutlet weak var locationSelector: UIPickerView!
    @IBOutlet weak var citySelector: UIPickerView!
    
    @IBOutlet weak var locationSelectorLeft: NSLayoutConstraint!
    @IBOutlet weak var cityValue: UITextField!
    @IBOutlet weak var locationValue: UITextField!
    
    @IBOutlet weak var citySelectorLeft: NSLayoutConstraint!

    let citiesList = ["Bhopal","Bangalore","Indore","Delhi","Kolkata"]
    let locationList = ["Indrapuri", "Nizzamuddin","Karamveer", "Ibrahimpura"]
    
    @IBAction func locationMenuPopUp(_ sender: UITextField) {
        locationSelector.isHidden = false
        UIView.animate(withDuration: 1, animations: { self.locationSelector.frame.origin.x = 0 }, completion: nil)
        UIView.animate(withDuration: 1, animations: { self.citySelector.frame.origin.x = -350}, completion: nil)
        citySelector.isHidden = true
        
   }
    @IBAction func submitButton(_ sender: UIButton) {
        if cityValue.text! == "" || locationValue.text! == "" || !citiesList.contains(cityValue.text!) || !locationList.contains(locationValue.text!) {
            cityValue.backgroundColor = UIColor.red
            locationValue.backgroundColor = UIColor.red
        }else{
            cityValue.backgroundColor = UIColor.white
            locationValue.backgroundColor = UIColor.white
            performSegue(withIdentifier: "shopList", sender: self)
        }
    }
    
    
   /* @IBAction func locationMenuAfterEditingAction(_ sender: UITextField) {
        //locationSelector.isHidden = true
        UIView.animate(withDuration: 1, animations: { self.locationSelector.frame.origin.x = 350 }, completion: nil)
        UIView.animate(withDuration: 1, animations: { self.citySelector.frame.origin.x = 0 }, completion: nil)
        
        
    }*/
    
    @IBAction func cityMenuPopUp(_ sender: UITextField) {
        citySelector.isHidden = false
        
        UIView.animate(withDuration: 1, animations: { self.citySelector.frame.origin.x = 0 }, completion: nil)
        UIView.animate(withDuration: 1, animations: { self.locationSelector.frame.origin.x = 350 }, completion: nil)
        locationSelector.isHidden = true
        
       /* if let locationTextValue = sender.text {
            if !locationList.contains(locationTextValue) {
                locationValue.text = ""
            }
        }*/
    }
    
   /* @IBAction func cityMenuAfterEditingAction(_ sender: UITextField) {
        //citySelector.isHidden = true
        
     //   UIView.animate(withDuration: 1, animations: { self.citySelector.frame.origin.x = 0 }, completion: nil)
      //  if let cityTextValue = sender.text {
        //    if !citiesList.contains(cityTextValue) {
          //      cityValue.text = ""
      //      }
      //  }
    }*/
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == citySelector {
            return citiesList[row]
        }else{
            return locationList[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == citySelector {
            return citiesList.count
        }else{
            return locationList.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == citySelector {
            cityValue.text = citiesList[row]
        }else{
            locationValue.text = locationList[row]
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locationSelector.isHidden = true
        citySelector.isHidden = true
        //citySelector.frame.origin.x = -350
        //locationSelector.frame.origin.x = 350
    }
}


