//
//  ViewController.swift
//  99Balloon
//
//  Created by Tamer Shahin on 20/11/2014.
//  Copyright (c) 2014 Tasin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var ballonImage: UIImageView!
    
    @IBOutlet weak var balloonLabel: UILabel!
    
    var myBallons:[Balloon] = []
    var currentIndex = 0
    let maxBalloons = 10
    
    func createBallons(number: Int){
        for (var index = 1; index <= number; index++){
            var randomIndex = Int(arc4random_uniform(UInt32(4)))
            var image = getImage(randomIndex)
            self.myBallons.append(Balloon(number: index, image: image))
        }
    }
    
    func getImage(imageNumber:Int) ->UIImage {
        switch imageNumber{
        case 1 :
            return UIImage(named: "RedBalloon1.jpg")!
        case 2:
            return UIImage(named: "RedBalloon2.jpg")!
        case 3:
            return UIImage(named: "RedBalloon3.jpg")!
        default:
            return UIImage(named: "RedBalloon4.jpg")!
            
        }
    }
    
    @IBAction func nextBalloonButtonPressed(sender: AnyObject) {
        if (currentIndex == maxBalloons){
            currentIndex = 0
        }
        var balloon = myBallons[currentIndex++]
        self.balloonLabel.hidden=true
        UIView.transitionWithView(self.view,
            duration: 2,
            options: UIViewAnimationOptions.TransitionCrossDissolve,
            animations: {
                self.ballonImage.image = balloon.image
                self.balloonLabel.text = "\(balloon.number)"
                self.balloonLabel.hidden = false
            }, completion: {
                (finished: Bool) -> () in
            }
        )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        createBallons(maxBalloons)
        println(self.myBallons)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

