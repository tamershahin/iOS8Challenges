//
//  LionCub.swift
//  LionsAndTigers
//
//  Created by Tamer Shahin on 20/11/2014.
//  Copyright (c) 2014 Tasin. All rights reserved.
//

import Foundation

class LionCub: Lion{
    
    func rubLionCubBelly(){
        
    }
    
    override func roar() {
        super.roar()
        println("LionCub: Growl Growl")
    }
    
    override func randomFact() -> String {
        var randomFactString:String
        
        if isAlphaMale {
            randomFactString = "Cubs are usually hidden in the dense bush for approximately six weeks."
        }
        else {
            randomFactString = "Cubs begin eating meat at about the age of six weeks"
        }
        return randomFactString
    }
    
}