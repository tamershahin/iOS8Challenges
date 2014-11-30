//
//  CustomerFactory.swift
//  LemonStand
//
//  Created by Tamer Shahin on 25/11/2014.
//  Copyright (c) 2014 Tasin. All rights reserved.
//

import Foundation

class CustomerFactory {

    class func createCustomers(number:Int) -> [Customer] {

        var customers:[Customer] = []
        for (var i = 0 ; i<=number; i++){
            var randomNumber:Float = Float(arc4random()) /  Float(UInt32.max)
            var customer:Customer = createCustomer(randomNumber)
            customers.append(customer)
        }
        return customers
    }

    class func createCustomer(randomNumber:Float) -> Customer {
        var taste:TastePref
        if (randomNumber < 0.4) {
            taste = TastePref.DILUTED
        } else if (randomNumber >= 0.4 && randomNumber < 0.6){
            taste = TastePref.NEUTRAL
        } else {
            taste = TastePref.ACID
        }
        return Customer(tastePref: taste)
    }
}