//
//  Lion.swift
//  TigersAndLions
//
//  Created by Otavio Monteagudo on 6/7/15.
//  Copyright (c) 2015 Otavio Monteagudo. All rights reserved.
//

import Foundation;
import UIKit;

class Lion {
    var age = 0 ;
    var isAlphaMale = false ;
    var image = UIImage(named:"") ;
    var name = "" ;
    var subspecies = "" ;
    
    func roar() -> Void {
        println("Lion(ess): RAAAWR RAAAAWR, MUDAFUCKA");
    }
    
    func roarNTimes (nTimes: Int) -> Void {
        var randomScream:Int;
        for i in 0...nTimes {
            randomScream = Int(arc4random_uniform(UInt32(2)));
            if (randomScream == 1){
                println("Lion(ess): RAAAWR RAAAAWR #\(i + 1), MUDAFUCKA");
            } else {
                println("LION(ESS) SCREAM NUMBER \(i + 1), RAAAWR RAAAAWR");
            }
        }
    }
    
    func ageInLionYear(humanAge: Int) -> Int {
        let lionAge = humanAge * 3;
        return lionAge;
    }
    
    func makeAlphaMale() -> Void {
        var alpha = Int(arc4random_uniform(UInt32(3))); // 1 in 3 chance.
        if (alpha == 3) {
            var name:[String] = split(self.name) {
                $0 == " ";
            };
            if (name[name.count-1] == "Lion") {
                self.isAlphaMale = true ;
            }
        }
    }
    
}

// inherits from Lion

class LionCub:Lion {
    
    var isSimba = false;
    
    // overrides = creates an individual version of the method in the child class.
    override func roar() -> Void {
        println("Lion(ess) Cub: RAAAWR RAAAAWR, MUDAFUCKA");
    }
    
    override func roarNTimes (nTimes: Int) -> Void {
        super.roarNTimes(nTimes); // means "get the code from this method in the super class"
        // now, anything written bellow will extend the original method.
        println("LION CUB LULZ");
    }
    
}

/*
Instantiating:

var lioness = Lion()
lioness.age = 3
lioness.isAlphaMale = false
lioness.image = UIImage(named: "Lioness.jpeg")
lioness.name = "Sarabi"
lioness.subspecies = "Barbary"
*/