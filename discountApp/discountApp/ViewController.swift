//
//  ViewController.swift
//  discountApp
//
//  Created by Krishnan Venkatesh,Nikhil on 2/15/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var amountText: UITextField!
    @IBOutlet weak var discountText: UITextField!
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func submitButton(_ sender: UIButton) {
        var a = Double(amountText.text!)
        var d  =  Double(discountText.text!)
        
        var discountAmount  =  (a! * (d!/100))
        label.text = String(discountAmount)
    }
    
}

