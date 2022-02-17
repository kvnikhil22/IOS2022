//
//  ViewController.swift
//  KrishnanVenkatesh_Calculator
//
//  Created by Krishnan Venkatesh,Nikhil on 2/17/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewLoad: UILabel!
    
    var n1 = ""
    var n2 = ""
    var output = ""
    var operation = ""
    var currNum = ""
    var operationChange = false
    var changemode = false

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func AC(_ sender: UIButton) {
        clearAll()
    }
    func clearAll(){
        n1 = ""
        n2 = ""
        operationChange = false
        operation = ""
        currNum = ""
        viewLoad.text = ""
        changemode = false
    }
    func setData(_ num: String){
        if viewLoad.text == "0"{
            viewLoad.text = ""
        }
        else{
            if !operationChange{
                viewLoad.text! += num
                n1 += num
            }
            else{
                if !changemode{
                    viewLoad.text! += num
                    n2 += num
                }
                else{
                    viewLoad.text = ""
                    viewLoad.text! += num
                    n2 += num
                }
            }
        }
    }
    
    func calTemp(_ operation:String)->String {
        if n1 != "" && n2 != ""{
            if operation == "+"{
                n1 = String(Double(n1)! + Double(n2)!)
                currNum = n2
                n2 = ""
                return String(n1)
            }
            if operation == "-"{
                n1 = String(Double(n1)! - Double(n2)!)
                currNum = n2
                n2 = ""
                
                return String(n1)
            }
            if operation == "*"{
                n1 = String(Double(n1)! * Double(n2)!)
                currNum = n2
                n2 = ""
                return String(n1)
            }
            if operation == "/"{
                n1 = String(Double(n1)! / Double(n2)!)
                currNum = n2
                n2 = ""
                return String(n1)
            }
            if operation == "%" {
                let s1 = Double(n1)!
                let s2 = Double(n2)!
                var r = s1.remainder(dividingBy: s2)
                n1 = String(r)
                currNum = n2
                n2 = ""
                return String(n1)
            }
        }
        return ""
    }
    func outputFormatter(_ output:String)->String {
        let value = Double(output)!
        var outputStr = String(round(value * 100000) / 100000.0)
        
        if outputStr.contains(".0"){
            outputStr.removeSubrange(outputStr.index(outputStr.endIndex, offsetBy: -2)..<outputStr.endIndex)
        }
        
        return outputStr
}
    
    @IBAction func C(_ sender: UIButton) {
        n2 = ""
        viewLoad.text = ""
    }
    @IBAction func plusOrMinus(_ sender: UIButton) {
        if n1 == ""{
            viewLoad.text = "-" + viewLoad.text!
            n1 = "\(viewLoad.text!)"
        }
        else{
            viewLoad.text = "-" + viewLoad.text!
            n2 = "\(viewLoad.text!)"
        }
    }
    @IBAction func divide(_ sender: UIButton) {
        let temp = calTemp(operation)
        operation = "/"
        viewLoad.text = (temp != "") ? outputFormatter(temp) : ""
          if temp != "" {
              //            changemode = true
              if n2 != ""{
                  changemode = true
                  
                  if operationChange {
                      output = String(Double(temp)! / Double(n2)!)
                      print(output)
                      if output == "inf"{
                        viewLoad.text! = "Error"
                      }else{
                        viewLoad.text! = outputFormatter(output)
                      }
                  }
              }
          }
          operationChange = true
        
    }
    
    @IBAction func multiplication(_ sender: UIButton) {
        let temp = calTemp(operation)
        print("temp is \(temp)")
        operation = "*"
        currNum=""
        viewLoad.text = (temp != "") ? outputFormatter(temp) : ""
         
        operationChange = true
    }
    @IBAction func minus(_ sender: UIButton) {
        let temp = calTemp(operation)
        operation = "-"
       viewLoad.text = (temp != "") ? outputFormatter(temp) : ""
        if temp != "" {
            if n2 != ""{
                changemode = true
                currNum = n2;
                if operationChange {
                    output = String(Double(temp)! - Double(n2)!)
                   viewLoad.text! = outputFormatter(output)
                }
            }
        }
        operationChange = true
    }
    @IBAction func plus(_ sender: UIButton) {
        let temp = calTemp(operation)
        print("temp is \(temp)")
        operation = "+"
        currNum=""
        viewLoad.text = (temp != "") ? outputFormatter(temp) : ""
        operationChange = true
    }
    
    @IBAction func equals(_ sender: UIButton) {
        var res = ""
        switch operation {
        case "+":
            
            if currNum != "" {
                res = String(Double(n1)! + Double(currNum)!)
                viewLoad.text = outputFormatter(res)
                 n2 = currNum
            }else{
                res = String(Double(n1)! + Double(n2)!)
                viewLoad.text = outputFormatter(res)
            }
            n1 = res
            
            break
        case "*":
            if currNum != "" {
                res = String(Double(n1)! * Double(currNum)!)
                viewLoad.text = outputFormatter(res)
            }else{
                res = String(Double(n1)! * Double(n2)!)
                viewLoad.text = outputFormatter(res)
            }
            n1 = res
            
            break
        case "-":
            if currNum != "" {
                res = String(Double(n1)! - Double(currNum)!)
                viewLoad.text = outputFormatter(res)
                
            }else{
                res = String(Double(n1)! - Double(n2)!)
                viewLoad.text = outputFormatter(res)
               
            }
            n1 = res
            break
        case "/":
            if viewLoad.text == "Error"{
                clearAll()
            }else{
                if currNum != "" {
                    res = String(Double(n1)! / Double(currNum)!)
                    if res == "inf"{
                        viewLoad.text! = "Error"
                        return
                    }else{
                        viewLoad.text = outputFormatter(res)
                    }
                }else{
                    res = String(Double(n1)! / Double(n2)!)
                    if res == "inf"{
                        viewLoad.text! = "Error"
                        return
                    }else{
                        viewLoad.text = outputFormatter(res)
                    }
                }
                n1 = res
            }
            break
        case "%":
            if currNum != "" {
                viewLoad.text = outputFormatter(res)
                let s1 = Double(n1)!
                let s2 = Double(currNum)!
                var r = s1.remainder(dividingBy: s2)
                res = String(r)
                 n2 = currNum
            }else{
                let s1 = Double(n1)!
                let s2 = Double(n2)!
                var r = s1.remainder(dividingBy: s2)
                res = String(r)
                viewLoad.text = outputFormatter(res)
            }
            n1 = res
            
            break
            
        default:
            print("IOS")
        }
    
    }
    
    @IBAction func remainder(_ sender: UIButton) {
        let temp = calTemp(operation)
        print("temp is \(temp)")
        operation = "%"
        currNum=""
        viewLoad.text = (temp != "") ? outputFormatter(temp) : ""
         
        operationChange = true
    }
    @IBAction func dot(_ sender: UIButton) {
        setData(".")
    }
    
    @IBAction func zero(_ sender: UIButton) {
        setData("0")
    }
    
    @IBAction func one(_ sender: UIButton) {
        setData("1")
    }
    
    @IBAction func two(_ sender: UIButton) {
        setData("2")
    }
    
    @IBAction func three(_ sender: UIButton) {
        setData("3")
    }
    
    @IBAction func four(_ sender: UIButton) {
        setData("4")
    }
    
    @IBAction func five(_ sender: UIButton) {
        setData("5")
    }
    
    @IBAction func six(_ sender: UIButton) {
        setData("6")
    }
    
    @IBAction func seven(_ sender: UIButton) {
        setData("7")
    }
    
    @IBAction func eight(_ sender: UIButton) {
        setData("8")
    }
    
    @IBAction func nine(_ sender: UIButton) {
        setData("9")
    }
       
}

