//
//  ViewController.swift
//  LemonStand
//
//  Created by Tamer Shahin on 25/11/2014.
//  Copyright (c) 2014 Tasin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var firstContainer: UIView!
    var secondContainer: UIView!
    var thirdContainer: UIView!
    var fourthContainer: UIView!

    var money:Int = 10
    var lemons:Int = 1
    var iceCubes:Int = 2

    // Information Labels
    var lemonToBuyLabel:UILabel!
    var lemonToBuyTitle:UILabel!
    var iceToBuyLabel:UILabel!
    var iceToBuyTitle:UILabel!

    var lemonToMixLabel:UILabel!
    var lemonToMixTitle:UILabel!
    var iceToMixLabel:UILabel!
    var iceToMixTitle:UILabel!


    var titleLabel: UILabel!
    var moneyLabel: UILabel!
    var lemonLabel: UILabel!
    var iceCubesLabel: UILabel!

    // constants

    let kFourth:CGFloat = 1.0/4.0
    let kMarginForView:CGFloat = 10.0
    let kInterline:CGFloat = 20.0

    // steppers

    var buyLemonStepper: UIStepper!
    var buyIceStepper: UIStepper!
    var mixLemonStepper: UIStepper!
    var mixIceStepper: UIStepper!


    func setupContainerViews()  {
        self.firstContainer = UIView(frame:
            CGRect( x: self.view.bounds.origin.x + kMarginForView,
                y: self.view.bounds.origin.y + kMarginForView ,
                width: self.view.bounds.width - (kMarginForView * 2),
                height: self.view.bounds.height * kFourth)
        )

        self.secondContainer = UIView(frame:
            CGRect(x: self.view.bounds.origin.x + kMarginForView,
                y: firstContainer.frame.height,
                width: self.view.bounds.width - (kMarginForView * 2),
                height: self.view.bounds.height * kFourth)
        )

        self.thirdContainer = UIView(frame:
            CGRect(x: self.view.bounds.origin.x + kMarginForView,
                y: firstContainer.frame.height + secondContainer.frame.height,
                width: self.view.bounds.width - (kMarginForView * 2),
                height: self.view.bounds.height * kFourth)
        )

        self.fourthContainer = UIView(frame:
            CGRect(x: self.view.bounds.origin.x + kMarginForView,
                y: firstContainer.frame.height + secondContainer.frame.height + thirdContainer.frame.height,
                width: self.view.bounds.width - (kMarginForView * 2),
                height: self.view.bounds.height * kFourth))

        self.firstContainer.backgroundColor = UIColor.lightGrayColor()
        self.secondContainer.backgroundColor = UIColor.darkGrayColor()
        self.thirdContainer.backgroundColor = UIColor.lightGrayColor()
        self.fourthContainer.backgroundColor = UIColor.blackColor()

        self.view.addSubview(self.firstContainer)
        self.view.addSubview(self.secondContainer)
        self.view.addSubview(self.thirdContainer)
        self.view.addSubview(self.fourthContainer)


    }


    func setupFirstContainer(containerView: UIView) {
        var oneCol = containerView.frame.width * kFourth
        var oneRow = containerView.frame.height * kFourth

        self.titleLabel = UILabel()
        self.titleLabel.text = "You Have"
        self.titleLabel.textColor = UIColor.blackColor()
        self.titleLabel.sizeToFit()
        self.titleLabel.textAlignment = NSTextAlignment.Left
        self.titleLabel.center = CGPoint(x: oneCol , y: oneRow)

        self.moneyLabel = UILabel()

        self.moneyLabel.textColor = UIColor.greenColor()
        self.moneyLabel.text = "$\(self.money)"
        self.moneyLabel.sizeToFit()
        self.moneyLabel.alignmentRectInsets()
        self.moneyLabel.center = CGPoint(x: oneCol * 2, y: oneRow)

        self.lemonLabel = UILabel()
        self.lemonLabel.textColor = UIColor.yellowColor()
        self.lemonLabel.text = "\(self.lemons) Lemons"
        self.lemonLabel.sizeToFit()
        self.lemonLabel.textAlignment = NSTextAlignment.Left
        self.lemonLabel.center = CGPoint(x: oneCol * 2, y: oneRow * 2)

        self.iceCubesLabel = UILabel()
        self.iceCubesLabel.text = "\(iceCubes) Ice Cubes"
        self.iceCubesLabel.textColor = UIColor.blueColor()
        self.iceCubesLabel.sizeToFit()
        self.iceCubesLabel.textAlignment = NSTextAlignment.Left
        self.iceCubesLabel.center = CGPoint(x: oneCol * 2, y: oneRow * 3 )

        containerView.addSubview(self.titleLabel)
        containerView.addSubview(self.moneyLabel)
        containerView.addSubview(self.lemonLabel)
        containerView.addSubview(self.iceCubesLabel)

    }

    func removeStockImageViews () {
        if self.firstContainer != nil {
            let subViews:Array? = self.firstContainer.subviews
            for view in subViews! {
                view.removeFromSuperview()
            }
        }
    }


    func refreshLemonAndIceStock(){
        removeStockImageViews()
        self.setupFirstContainer(self.firstContainer)
    }

    func setupSecondContainer(containerView: UIView) {

        var oneCol = containerView.frame.width * kFourth
        var oneRow = containerView.frame.height * kFourth

        self.lemonToBuyLabel = UILabel()
        self.lemonToBuyLabel.text = "0"
        self.lemonToBuyLabel.textColor = UIColor.whiteColor()
        self.lemonToBuyLabel.sizeToFit()
        self.lemonToBuyLabel.alignmentRectInsets()
        self.lemonToBuyLabel.textAlignment = NSTextAlignment.Left
        self.lemonToBuyLabel.center = CGPoint(x: oneCol * 2, y: oneRow)

        self.lemonToBuyTitle = UILabel()
        self.lemonToBuyTitle.text = "Lemons For $2:"
        self.lemonToBuyTitle.textColor = UIColor.whiteColor()
        self.lemonToBuyTitle.sizeToFit()
        self.lemonToBuyTitle.textAlignment = NSTextAlignment.Right
        self.lemonToBuyTitle.center = CGPoint(x: oneCol * CGFloat(1.1), y: oneRow)

        self.buyLemonStepper = UIStepper()
        self.buyLemonStepper.center = CGPoint(x: oneCol * 3, y:oneRow)
        self.buyLemonStepper.autorepeat = true
        self.buyLemonStepper.maximumValue = 10 // to bind to max money

        self.buyLemonStepper.value = 0
        self.buyLemonStepper.stepValue = 1
        self.buyLemonStepper.maximumValue = 10.00
        self.buyLemonStepper.minimumValue = 0
        self.buyLemonStepper.addTarget(self, action: "buyLemonStepperValueChanged:", forControlEvents: UIControlEvents.TouchUpInside)


        // ice

        self.iceToBuyLabel = UILabel()
        self.iceToBuyLabel.text = "0"
        self.iceToBuyLabel.textColor = UIColor.whiteColor()
        self.iceToBuyLabel.sizeToFit()
        self.iceToBuyLabel.alignmentRectInsets()
        self.iceToBuyLabel.textAlignment = NSTextAlignment.Left
        self.iceToBuyLabel.center = CGPoint(x: oneCol * 2, y: oneRow * 2)

        self.iceToBuyTitle = UILabel()
        self.iceToBuyTitle.text = "Ice Cubes For $1:"
        self.iceToBuyTitle.textColor = UIColor.whiteColor()
        self.iceToBuyTitle.sizeToFit()
        self.iceToBuyTitle.textAlignment = NSTextAlignment.Right
        self.iceToBuyTitle.center = CGPoint(x: oneCol * CGFloat(1.1), y: oneRow * 2)

        self.buyIceStepper = UIStepper()
        self.buyIceStepper.center = CGPoint(x: oneCol * 3, y:oneRow * 2)
        self.buyIceStepper.autorepeat = true
        self.buyIceStepper.maximumValue = 10 // to bind to max money

        self.buyIceStepper.value = 0
        self.buyIceStepper.stepValue = 1
        self.buyIceStepper.maximumValue = 10.00
        self.buyIceStepper.minimumValue = 0
        self.buyIceStepper.addTarget(self, action: "buyIceStepperValueChanged:", forControlEvents: UIControlEvents.TouchUpInside)



        containerView.addSubview(lemonToBuyLabel)
        containerView.addSubview(lemonToBuyTitle)
        containerView.addSubview(buyLemonStepper)
        containerView.addSubview(iceToBuyLabel)
        containerView.addSubview(iceToBuyTitle)
        containerView.addSubview(buyIceStepper)

    }

    func buyLemonStepperValueChanged(sender: UIStepper) {
        var value = Int(sender.value)
        if (value * 2 <= money)
        {
            self.lemonToBuyLabel.text = value.description
            self.lemonToBuyLabel.sizeToFit()
            self.money -= value * 2
            self.moneyLabel.text = "$\(money)"
            self.lemons++
        }
        else{
            showAlertWithText(header: "No more money", message: "Reset Game")
        }
        refreshLemonAndIceStock()

    }

    func buyIceStepperValueChanged(sender: UIStepper) {
        var value = Int(sender.value)
        if (value <= money)
        {
            self.iceToBuyLabel.text = value.description
            self.iceToBuyLabel.sizeToFit()
            self.money -= value
            self.moneyLabel.text = "$\(money)"
            self.iceCubes++
        }
        else{
            showAlertWithText(header: "No more money", message: "Reset Game")
        }
        refreshLemonAndIceStock()
    }

    func setupThirdContainer(containerView: UIView) {

        var oneCol = containerView.frame.width * kFourth
        var oneRow = containerView.frame.height * kFourth

        self.lemonToMixLabel = UILabel()
        self.lemonToMixLabel.text = "0"
        self.lemonToMixLabel.textColor = UIColor.whiteColor()
        self.lemonToMixLabel.sizeToFit()
        self.lemonToMixLabel.alignmentRectInsets()
        self.lemonToMixLabel.textAlignment = NSTextAlignment.Left
        self.lemonToMixLabel.center = CGPoint(x: oneCol * 2, y: oneRow)

        self.lemonToMixTitle = UILabel()
        self.lemonToMixTitle.text = "Lemons:"
        self.lemonToMixTitle.textColor = UIColor.whiteColor()
        self.lemonToMixTitle.sizeToFit()
        self.lemonToMixTitle.textAlignment = NSTextAlignment.Right
        self.lemonToMixTitle.center = CGPoint(x: oneCol * CGFloat(1.1), y: oneRow)

        self.mixLemonStepper = UIStepper()
        self.mixLemonStepper.center = CGPoint(x: oneCol * 3, y:oneRow)
        self.mixLemonStepper.autorepeat = true
        self.mixLemonStepper.maximumValue = 10 // to bind to max money
        self.mixLemonStepper.value = 0
        self.mixLemonStepper.stepValue = 1
        self.mixLemonStepper.maximumValue = 10.00
        self.mixLemonStepper.minimumValue = 0
        self.mixLemonStepper.addTarget(self, action: "mixLemonStepperValueChanged:", forControlEvents: UIControlEvents.TouchUpInside)


        // ice

        self.iceToMixLabel = UILabel()
        self.iceToMixLabel.text = "0"
        self.iceToMixLabel.textColor = UIColor.whiteColor()
        self.iceToMixLabel.sizeToFit()
        self.iceToMixLabel.alignmentRectInsets()
        self.iceToMixLabel.textAlignment = NSTextAlignment.Left
        self.iceToMixLabel.center = CGPoint(x: oneCol * 2, y: oneRow * 2)

        self.iceToMixTitle = UILabel()
        self.iceToMixTitle.text = "Ice Cubes:"
        self.iceToMixTitle.textColor = UIColor.whiteColor()
        self.iceToMixTitle.sizeToFit()
        self.iceToMixTitle.textAlignment = NSTextAlignment.Right
        self.iceToMixTitle.center = CGPoint(x: oneCol * CGFloat(1.1), y: oneRow * 2)

        self.mixIceStepper = UIStepper()
        self.mixIceStepper.center = CGPoint(x: oneCol * 3, y:oneRow * 2)
        self.mixIceStepper.autorepeat = true
        self.mixIceStepper.maximumValue = 10 // to bind to max money

        self.mixIceStepper.value = 0
        self.mixIceStepper.stepValue = 1
        self.mixIceStepper.maximumValue = 10.00
        self.mixIceStepper.minimumValue = 0
        self.mixIceStepper.addTarget(self, action: "mixIceStepperValueChanged:", forControlEvents: UIControlEvents.TouchUpInside)



        containerView.addSubview(lemonToMixLabel)
        containerView.addSubview(lemonToMixTitle)
        containerView.addSubview(mixLemonStepper)
        containerView.addSubview(iceToMixLabel)
        containerView.addSubview(iceToMixTitle)
        containerView.addSubview(mixIceStepper)
        
    }

    func mixLemonStepperValueChanged(sender: UIStepper) {
        var value = Int(sender.value)
        if (value <= lemons)
        {
            self.lemonToMixLabel.text = value.description
            self.lemonToMixLabel.sizeToFit()
            self.lemons--
        }
        else{
            showAlertWithText(header: "No more lemons", message: "Buy More")
        }
        refreshLemonAndIceStock()

    }

    func mixIceStepperValueChanged(sender: UIStepper) {
        var value = Int(sender.value)
        if (value <= money)
        {
            self.iceToMixLabel.text = value.description
            self.iceToMixLabel.sizeToFit()
           self.iceCubes--
        }
        else{
            showAlertWithText(header: "No more ice cubes", message: "Buy More")
        }
        refreshLemonAndIceStock()
    }
    


    func showAlertWithText (header : String = "Warning", message : String) {
        var alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupContainerViews()
        setupFirstContainer(self.firstContainer)
        setupSecondContainer(self.secondContainer)
        setupThirdContainer(self.thirdContainer)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

