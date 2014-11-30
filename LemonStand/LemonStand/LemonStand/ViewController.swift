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
    var mixLemonStepperPrevValue:Int = 0
    var mixIceCubesStepperPrevValue:Int = 0

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

    // buttons

    var buyLemonPlus: UIButton!
    var buyLemonMinus: UIButton!

    var buyIcePlus: UIButton!
    var buyIceMinus: UIButton!

    var mixLemonPlus: UIButton!
    var mixLemonMinus: UIButton!

    var mixIcePlus: UIButton!
    var mixIceMinus: UIButton!

    var startDayButton: UIButton!

    // console label

    var consoleLabel: UILabel!


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

    func removeSubViewsFromContainer (containerView: UIView!) {
        if containerView != nil {
            let subViews:Array? = containerView.subviews
            for view in subViews! {
                view.removeFromSuperview()
            }
        }
    }


    func refreshInventory(){
        removeSubViewsFromContainer(self.firstContainer)
        self.setupFirstContainer(self.firstContainer)
    }

    func refreshDailyShops(){
        removeSubViewsFromContainer(self.secondContainer)
        self.setupSecondContainer(self.secondContainer)
    }


    func refreshDailyMix(){
        removeSubViewsFromContainer(self.thirdContainer)
        self.setupThirdContainer(self.thirdContainer)
    }

    func setupSecondContainer(containerView: UIView) {

        var oneCol = containerView.frame.width * kFourth
        var oneRow = containerView.frame.height * kFourth

        self.lemonToBuyTitle = UILabel()
        self.lemonToBuyTitle.text = "Lemons For $2:"
        self.lemonToBuyTitle.textColor = UIColor.whiteColor()
        self.lemonToBuyTitle.sizeToFit()
        self.lemonToBuyTitle.textAlignment = NSTextAlignment.Right
        self.lemonToBuyTitle.center = CGPoint(x: oneCol * CGFloat(1.1), y: oneRow)

        self.buyLemonPlus  = UIButton( frame: CGRect(x: oneCol * 2 + kMarginForView * 2, y: oneRow - 5, width: 10 , height: 10))
        self.buyLemonPlus.setTitle("+", forState: UIControlState.Normal)
        self.buyLemonPlus.addTarget(self, action: "buyLemonPlusButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)

        self.lemonToBuyLabel = UILabel()
        self.lemonToBuyLabel.text = "0"
        self.lemonToBuyLabel.textColor = UIColor.whiteColor()
        self.lemonToBuyLabel.sizeToFit()
        self.lemonToBuyLabel.alignmentRectInsets()
        self.lemonToBuyLabel.textAlignment = NSTextAlignment.Left
        self.lemonToBuyLabel.center = CGPoint(x: oneCol * 2 + kMarginForView * 5, y: oneRow)

        self.buyLemonMinus  = UIButton( frame: CGRect(x: oneCol * 2 + kMarginForView * 7, y: oneRow - 5, width: 10 , height: 10))
        self.buyLemonMinus.setTitle("-", forState: UIControlState.Normal)
        self.buyLemonMinus.addTarget(self, action: "buyLemonMinusButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)

        // ice

        self.iceToBuyTitle = UILabel()
        self.iceToBuyTitle.text = "Ice Cubes For $1:"
        self.iceToBuyTitle.textColor = UIColor.whiteColor()
        self.iceToBuyTitle.sizeToFit()
        self.iceToBuyTitle.textAlignment = NSTextAlignment.Right
        self.iceToBuyTitle.center = CGPoint(x: oneCol * CGFloat(1.1), y: oneRow * 2)

        self.buyIcePlus  = UIButton( frame: CGRect(x: oneCol * 2 + kMarginForView * 2, y: oneRow * 2 - 5, width: 10 , height: 10))
        self.buyIcePlus.setTitle("+", forState: UIControlState.Normal)
        self.buyIcePlus.addTarget(self, action: "buyIcePlusButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)

        self.iceToBuyLabel = UILabel()
        self.iceToBuyLabel.text = "0"
        self.iceToBuyLabel.textColor = UIColor.whiteColor()
        self.iceToBuyLabel.sizeToFit()
        self.iceToBuyLabel.alignmentRectInsets()
        self.iceToBuyLabel.textAlignment = NSTextAlignment.Left
        self.iceToBuyLabel.center = CGPoint(x: oneCol * 2 + kMarginForView * 5, y: oneRow * 2)

        self.buyIceMinus  = UIButton( frame: CGRect(x: oneCol * 2 + kMarginForView * 7, y: oneRow * 2 - 5, width: 10 , height: 10))
        self.buyIceMinus.setTitle("-", forState: UIControlState.Normal)
        self.buyIceMinus.addTarget(self, action: "buyIceMinusButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)


        containerView.addSubview(lemonToBuyLabel)
        containerView.addSubview(lemonToBuyTitle)
        containerView.addSubview(buyLemonPlus)
        containerView.addSubview(buyLemonMinus)
        containerView.addSubview(iceToBuyLabel)
        containerView.addSubview(iceToBuyTitle)
        containerView.addSubview(buyIcePlus)
        containerView.addSubview(buyIceMinus)

    }

    func buyLemonPlusButtonPressed(sender: UIButton) {
        var toBuy:Int = lemonToBuyLabel.text!.toInt()!
        if (money > 1 ){
            toBuy++
            self.lemonToBuyLabel.text = "\(toBuy)"
            self.lemonToBuyLabel.sizeToFit()
            self.money -= 2
            self.moneyLabel.text = "$\(money)"
            self.lemons++
        }
        else{
            showAlertWithText(header: "No more money", message: "Reset Game")
        }
        refreshInventory()
    }

    func buyLemonMinusButtonPressed(sender: UIButton) {
        var toBuy:Int = lemonToBuyLabel.text!.toInt()!
        if (toBuy > 0 ){
            toBuy--
            self.lemonToBuyLabel.text = "\(toBuy)"
            self.lemonToBuyLabel.sizeToFit()
            self.money += 2
            self.moneyLabel.text = "$\(money)"
            self.lemons--
        }
        refreshInventory()
    }

    func buyIcePlusButtonPressed(sender: UIButton) {
        var toBuy:Int = iceToBuyLabel.text!.toInt()!
        if (money > 0 ){
            toBuy++
            self.iceToBuyLabel.text = "\(toBuy)"
            self.iceToBuyLabel.sizeToFit()
            self.money--
            self.moneyLabel.text = "$\(money)"
            self.iceCubes++
        }
        else{
            showAlertWithText(header: "No more money", message: "Reset Game")
        }
        refreshInventory()
    }

    func buyIceMinusButtonPressed(sender: UIButton) {
        var toBuy:Int = iceToBuyLabel.text!.toInt()!
        if (toBuy > 0 ){
            toBuy--
            self.iceToBuyLabel.text = "\(toBuy)"
            self.iceToBuyLabel.sizeToFit()
            self.money++
            self.moneyLabel.text = "$\(money)"
            self.iceCubes--
        }
        refreshInventory()
    }

    func setupThirdContainer(containerView: UIView) {

        var oneCol = containerView.frame.width * kFourth
        var oneRow = containerView.frame.height * kFourth

        self.lemonToMixTitle = UILabel()
        self.lemonToMixTitle.text = "Lemons:"
        self.lemonToMixTitle.textColor = UIColor.whiteColor()
        self.lemonToMixTitle.sizeToFit()
        self.lemonToMixTitle.textAlignment = NSTextAlignment.Right
        self.lemonToMixTitle.center = CGPoint(x: oneCol * CGFloat(1.1), y: oneRow)

        self.mixLemonPlus  = UIButton( frame: CGRect(x: oneCol * 2 + kMarginForView * 2, y: oneRow - 5, width: 10 , height: 10))
        self.mixLemonPlus.setTitle("+", forState: UIControlState.Normal)
        self.mixLemonPlus.addTarget(self, action: "mixLemonPlusButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)

        self.lemonToMixLabel = UILabel()
        self.lemonToMixLabel.text = "0"
        self.lemonToMixLabel.textColor = UIColor.whiteColor()
        self.lemonToMixLabel.sizeToFit()
        self.lemonToMixLabel.alignmentRectInsets()
        self.lemonToMixLabel.textAlignment = NSTextAlignment.Left
        self.lemonToMixLabel.center = CGPoint(x: oneCol * 2 + kMarginForView * 5, y: oneRow )

        self.mixLemonMinus  = UIButton( frame: CGRect(x: oneCol * 2 + kMarginForView * 7, y: oneRow - 5, width: 10 , height: 10))
        self.mixLemonMinus.setTitle("-", forState: UIControlState.Normal)
        self.mixLemonMinus.addTarget(self, action: "mixLemonMinusButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)

        // ice

        self.iceToMixTitle = UILabel()
        self.iceToMixTitle.text = "Ice Cubes:"
        self.iceToMixTitle.textColor = UIColor.whiteColor()
        self.iceToMixTitle.sizeToFit()
        self.iceToMixTitle.textAlignment = NSTextAlignment.Right
        self.iceToMixTitle.center = CGPoint(x: oneCol * CGFloat(1.1), y: oneRow * 2)

        self.mixIcePlus  = UIButton( frame: CGRect(x: oneCol * 2 + kMarginForView * 2, y: oneRow * 2 - 5, width: 10 , height: 10))
        self.mixIcePlus.setTitle("+", forState: UIControlState.Normal)
        self.mixIcePlus.addTarget(self, action: "mixIcePlusButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)

        self.iceToMixLabel = UILabel()
        self.iceToMixLabel.text = "0"
        self.iceToMixLabel.textColor = UIColor.whiteColor()
        self.iceToMixLabel.sizeToFit()
        self.iceToMixLabel.alignmentRectInsets()
        self.iceToMixLabel.textAlignment = NSTextAlignment.Left
        self.iceToMixLabel.center = CGPoint(x: oneCol * 2 + kMarginForView * 5, y: oneRow * 2)

        self.mixIceMinus  = UIButton( frame: CGRect(x: oneCol * 2 + kMarginForView * 7, y: oneRow * 2 - 5, width: 10 , height: 10))
        self.mixIceMinus.setTitle("-", forState: UIControlState.Normal)
        self.mixIceMinus.addTarget(self, action: "mixIceMinusButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)

        containerView.addSubview(lemonToMixLabel)
        containerView.addSubview(lemonToMixTitle)
        containerView.addSubview(mixLemonPlus)
        containerView.addSubview(mixLemonMinus)
        containerView.addSubview(iceToMixLabel)
        containerView.addSubview(iceToMixTitle)
        containerView.addSubview(mixIcePlus)
        containerView.addSubview(mixIceMinus)

    }

    func mixLemonPlusButtonPressed(sender: UIButton) {
        var toMix:Int = lemonToMixLabel.text!.toInt()!
        if (lemons > 0 ){
            toMix++
            self.lemonToMixLabel.text = "\(toMix)"
            self.lemonToMixLabel.sizeToFit()
            self.lemons--
        }
        else{
            showAlertWithText(header: "No more lemons", message: "Buy Some")
        }
        refreshInventory()
    }

    func mixLemonMinusButtonPressed(sender: UIButton) {
        var toMix:Int = lemonToMixLabel.text!.toInt()!
        if (toMix > 0 ){
            toMix--
            self.lemonToMixLabel.text = "\(toMix)"
            self.lemonToMixLabel.sizeToFit()
            self.lemons++
        }
        refreshInventory()
    }

    func mixIcePlusButtonPressed(sender: UIButton) {
        var toMix:Int = iceToMixLabel.text!.toInt()!
        if (iceCubes > 0 ){
            toMix++
            self.iceToMixLabel.text = "\(toMix)"
            self.iceToMixLabel.sizeToFit()
            self.iceCubes--
        }
        else{
            showAlertWithText(header: "No more money", message: "Reset Game")
        }
        refreshInventory()
    }

    func mixIceMinusButtonPressed(sender: UIButton) {
        var toBuy:Int = iceToMixLabel.text!.toInt()!
        if (toBuy > 0 ){
            toBuy--
            self.iceToMixLabel.text = "\(toBuy)"
            self.iceToMixLabel.sizeToFit()
            self.iceCubes++
        }
        refreshInventory()
    }


    func showAlertWithText (header : String = "Warning", message : String) {
        var alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }

    func setupFourthContainer(containerView: UIView) {

        var oneCol = containerView.frame.width * kFourth
        var oneRow = containerView.frame.height * kFourth

        startDayButton = UIButton()
        startDayButton.center = CGPoint(x: oneCol * 2, y: containerView.bounds.origin.y + kMarginForView)
        startDayButton.setTitle("Start Day", forState: UIControlState.Normal)
        startDayButton.backgroundColor = UIColor.redColor()
        startDayButton.sizeToFit()
        startDayButton.hidden = false
        startDayButton.addTarget(self, action: "startDayButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)

        consoleLabel = UILabel(frame: CGRect(x: containerView.bounds.origin.x, y: oneRow, width: containerView.frame.width, height: containerView.frame.height))
        consoleLabel.text = ""
        consoleLabel.textColor = UIColor.whiteColor()
        consoleLabel.backgroundColor = UIColor.greenColor()
        consoleLabel.hidden = false
        consoleLabel.numberOfLines = 0;
        containerView.addSubview(startDayButton)
        containerView.addSubview(consoleLabel)

    }

    func startDayButtonPressed(sender: UIButton){

        var lemonToUse:Int = self.lemonToMixLabel.text!.toInt()!
        var iceToUse:Int = self.iceToMixLabel.text!.toInt()!

        if (lemonToUse ==  0){
            showAlertWithText(header: "cant' make lemonade without lemon", message: "add one to the mix")
            return
        }
        if (iceToUse == 0){
            showAlertWithText(header: "cant' make lemonade without ice cube", message: "add one to the mix")
            return
        }

        startDayButton.setTitle("Day Started", forState: UIControlState.Normal)
        startDayButton.sizeToFit()

        //create today lemonade

        var lemonade = Lemonade(lemons: lemonToUse, iceCubes: iceToUse)

        //create a random number of costumer
        var randomNumber = Int(arc4random_uniform(UInt32(10)))
        while randomNumber < 3 {
            randomNumber = Int(arc4random_uniform(UInt32(10)))
        }
        var todayCustomers:[Customer] = CustomerFactory.createCustomers(randomNumber)

        self.consoleLabel.text = "\n\(randomNumber) costumers today! \n\n" + self.consoleLabel.text!

        var width = self.consoleLabel.superview!.frame.width
        var height = self.consoleLabel.superview!.frame.height
        self.consoleLabel.sizeThatFits(CGSize(width: width, height: height))

        for (var i = 0; i < randomNumber; ++i) {
            var message  = "enjoyed the lemonade"
            if (todayCustomers[i].acceptLemonade(lemonade) == false){
                message = "didn't " + message
            }
            else{
                getPaid()
            }

            let message1 = "customer \(i) \(message)\n" + self.consoleLabel.text!

            delay(0.7 * Double(i)) {
                self.consoleLabel.text = message1
            }

        }

        delay(0.7 * Double(randomNumber)) {
            self.startDayButton.setTitle("Start Day", forState: UIControlState.Normal)
        }



        refreshDailyShops()
        refreshDailyMix()




    }

    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }


    func getPaid(){
        println ("payed")
        self.money++
        refreshInventory()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupContainerViews()
        setupFirstContainer(self.firstContainer)
        setupSecondContainer(self.secondContainer)
        setupThirdContainer(self.thirdContainer)
        setupFourthContainer(self.fourthContainer)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

