//
//  Customer.swift
//  LemonStand
//
//  Created by Tamer Shahin on 25/11/2014.
//  Copyright (c) 2014 Tasin. All rights reserved.
//

import Foundation


struct Customer{

    var tastePref:TastePref

    func acceptLemonade(lemonade:Lemonade) -> Bool {
        var lemonadeAcidity:Float = Float(lemonade.lemons / lemonade.iceCubes)
        switch tastePref{
        case .ACID:
            return lemonadeAcidity > 1
        case .DILUTED:
            return lemonadeAcidity < 1
        case .NEUTRAL:
            return lemonadeAcidity == 1
        }
    }
}

enum TastePref {
    case NEUTRAL
    case ACID
    case DILUTED
}