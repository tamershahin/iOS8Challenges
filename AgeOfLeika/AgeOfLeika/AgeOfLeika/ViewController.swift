//
//  ViewController.swift
//  AgeOfLeika
//
//  Created by Tamer Shahin on 17/11/2014.
//  Copyright (c) 2014 Tasin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dogsAgeLabel: UILabel!
    
    @IBOutlet weak var dogsAgeTextFied: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func convertDogsAgeButtonPressed(sender: AnyObject) {
        
        let age = dogsAgeTextFied.text.toInt()
        var finalValue:NSString
        if (age != nil) {
            if (age! <= 2) {
                
                finalValue = "\(Double(age!) * 10.5)"
            
            }
            else{
                finalValue = "\(21 + ((age! - 2) * 4))"
            }
        }
        else{
            finalValue = "enter a valid value for "
        }
        dogsAgeLabel.text = "\(finalValue) Human Years"
        dogsAgeLabel.hidden = false
        dogsAgeTextFied.resignFirstResponder()

    }
    
    
}

