//
//  ViewController.swift
//  LionsAndTigers
//
//  Created by Tamer Shahin on 18/11/2014.
//  Copyright (c) 2014 Tasin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var myImgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var breedLabel: UILabel!
    @IBOutlet weak var randomFactLabel: UILabel!
    
    var myTigers:[Tiger] = []
    var currentIndex:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var myTiger = Tiger()
        myTiger.age = 3
        myTiger.name = "Tigger"
        myTiger.breed = "Bengal"
        myTiger.image = UIImage(named: "BengalTiger.jpg")
        
        myTiger.chuff()
        
        var secondTiger = Tiger()
        secondTiger.name = "Tigress"
        secondTiger.breed = "Indochinese Tiger"
        secondTiger.age = 2
        secondTiger.image = UIImage(named:"IndochineseTiger.jpg")
        
        secondTiger.chuffANumerOfTimes(3)
        
        var thirdTiger = Tiger()
        thirdTiger.name = "Jacob"
        thirdTiger.breed = "Malayan Tiger"
        thirdTiger.age = 4
        thirdTiger.image = UIImage(named:"MalayanTiger.jpg")
        
        thirdTiger.chuffANumberOfTimes(5, isLoud: true)
        thirdTiger.chuffANumberOfTimes(5, isLoud: false)

        
        var fourthTiger = Tiger()
        fourthTiger.name = "Spar"
        fourthTiger.breed = "Siberian Tiger"
        fourthTiger.age = 5
        fourthTiger.image = UIImage(named:"SiberianTiger.jpg")
        
        myTigers = [myTiger, secondTiger, thirdTiger,fourthTiger]
        
        myImgView.image = fourthTiger.image
        ageLabel.text = "\(fourthTiger.age)"
        nameLabel.text = fourthTiger.name
        breedLabel.text = fourthTiger.breed
        randomFactLabel.text = fourthTiger.randomFact()
        
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func nextBarButtonPressed(sender: UIBarButtonItem) {
        var randomIndex:Int = 0
        do {
          randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
        }
        while randomIndex == currentIndex
        
        currentIndex = randomIndex
        
        let tiger = myTigers[currentIndex]
        
        UIView.transitionWithView(self.view,
            duration: 2,
            options: UIViewAnimationOptions.TransitionCrossDissolve,
            animations: {
                self.myImgView.image = tiger.image
                self.nameLabel.text = tiger.name
                self.ageLabel.text = "\(tiger.age)"
                self.breedLabel.text = tiger.breed
                self.randomFactLabel.text = tiger.randomFact()
                
            }, completion: {
                (finished: Bool) -> () in
            }
        )
    }
    
}

