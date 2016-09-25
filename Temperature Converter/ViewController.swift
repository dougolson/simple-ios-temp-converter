//
//  ViewController.swift
//  Temperature Converter
//
//  Created by Doug Olson on 9/24/16.
//  Copyright © 2016 Doug Olson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tempText: UITextField!
    @IBOutlet weak var tempResult: UILabel!
    @IBOutlet weak var conversionType: UISegmentedControl!
    
    var celsius = true
    var tempType = "Fahrenheit"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func conversionTypeChanged(_ sender: UISegmentedControl) {
        switch conversionType.selectedSegmentIndex
        {
        case 0:
            celsius = true
            tempType = "Fahrenheit"

        case 1:
            celsius = false
            tempType = "Celsius"

        default:
            break
        }
    }
    
    @IBAction func convertClicked(_ sender: UIButton) {
        if let result = tempText.text{ // if tempText != nil, more or less
            if (result == "") { // case of empty string
                return
            }
            else{
                if let num = Double(result) { // if result can be cast to Double
                    if(celsius) { // convert to F
                        let output = num * (9.0/5) + 32
                        tempResult.text = String(round(output)) + " " + tempType
                    } else { // convert to C
                        let output = (5.0/9)*(num - 32)
                        tempResult.text = String(round(output)) + " " + tempType
                    }
                }
            }
        }
    }
}

