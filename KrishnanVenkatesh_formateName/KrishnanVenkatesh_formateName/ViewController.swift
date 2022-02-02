//
//  ViewController.swift
//  KrishnanVenkatesh_formateName
//
//  Created by Other on 01/02/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstNameTextFeild: UITextField!
    @IBOutlet weak var lastNameTextFeild: UITextField!
   
      
    @IBOutlet weak var details: UILabel!
    
    
    
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var intialLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onClickOfSubmit(_ sender: UIButton) {
        var firstName = firstNameTextFeild.text!
        var lastName = lastNameTextFeild.text!
        fullNameLabel.text = ("Full Name: \(firstName), \(lastName)")
        details.text = ("Details")
        intialLabel.text =  "Initials: \(firstName[firstName.startIndex])\((lastName[lastName.startIndex]).uppercased())"
    }
    
    @IBAction func onClickOfReset(_ sender: UIButton) {
        firstNameTextFeild.text = " "
        lastNameTextFeild.text = " "
        fullNameLabel.text = " "
        lastNameTextFeild.text = " "
        details.text = " "
        intialLabel.text = " "
        firstNameTextFeild.becomeFirstResponder()
    }
    
}

