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
    var lions:[Lion] = []
    var lionCubs:[LionCub] = []
    var currentIndex:Int = 0
    
    var currentAnimal = (species: "Tiger", index: 0)
    
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
        
        var lion = Lion()
        lion.age = 4
        lion.isAlphaMale = false
        lion.image = UIImage(named:"Lion.jpg")
        lion.name = "Mufasa"
        lion.subspecies = "West African"
        
        var lioness = Lion()
        lioness.age = 3
        lioness.isAlphaMale = false
        lioness.image = UIImage(named: "Lioness.jpeg")
        lioness.name = "Sarabi"
        lioness.subspecies = "Barbary"
        
        self.lions += [lion, lioness]
        
        var lionCub = LionCub()
        lionCub.age = 1
        lionCub.name = "Simba"
        lionCub.image = UIImage(named: "LionCub1.jpg")
        lionCub.subspecies = "Masai"
        lionCub.isAlphaMale = true
        
        lionCub.roar()
        
        var femaleLionCub = LionCub()
        femaleLionCub.age = 1
        femaleLionCub.name = "Nala"
        femaleLionCub.image = UIImage(named: "LionCub2.jpeg")
        femaleLionCub.subspecies = "Transvaal"
        femaleLionCub.isAlphaMale = false
        
        self.lionCubs += [lionCub, femaleLionCub]
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func nextBarButtonPressed(sender: UIBarButtonItem) {
        updateAnimal()
        updateView()
    }
    
    func updateAnimal(){
        switch currentAnimal{
        case ("Tiger",_):
            let randomIndex = Int(arc4random_uniform(UInt32(lions.count)))
            currentAnimal = ("Lion",randomIndex)
        case ("Lion", _):
            let randomIndex = Int(arc4random_uniform(UInt32(lionCubs.count)))
            currentAnimal = ("LionCub", randomIndex)
        default:
            let randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
            currentAnimal = ("Tiger",randomIndex)
        }
    }
    
    func updateView(){
        
        UIView.transitionWithView(self.view,
            duration: 2,
            options: UIViewAnimationOptions.TransitionCrossDissolve,
            animations: {
                if (self.currentAnimal.species == "Tiger"){
                    let tiger = self.myTigers[self.currentAnimal.index]
                    self.myImgView.image = tiger.image
                    self.nameLabel.text = tiger.name
                    self.ageLabel.text = "\(tiger.age)"
                    self.breedLabel.text = tiger.breed
                    self.randomFactLabel.text = tiger.randomFact()
                }
                else if (self.currentAnimal.species == "Lion"){
                    let lion:Lion = self.lions[self.currentAnimal.index]
                    self.myImgView.image = lion.image
                    self.nameLabel.text = lion.name
                    self.ageLabel.text = "\(lion.age)"
                    self.breedLabel.text = lion.subspecies
                    self.randomFactLabel.text = lion.randomFact()
                    
                }
                else if self.currentAnimal.species == "LionCub" {
                    let lionCub = self.lionCubs[self.currentAnimal.index]
                    self.myImgView.image = lionCub.image
                    self.breedLabel.text = lionCub.subspecies
                    self.ageLabel.text = "\(lionCub.age)"
                    self.nameLabel.text = lionCub.name
                    self.randomFactLabel.text = lionCub.randomFact()
                }
                self.randomFactLabel.hidden = false
            }, completion: {
                (finished: Bool) -> () in
            }
        )
    }
    
}

