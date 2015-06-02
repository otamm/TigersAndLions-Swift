//
//  Tiger.swift
//  TigersAndLions
//
//  Created by Otavio Monteagudo on 5/28/15.
//  Copyright (c) 2015 Otavio Monteagudo. All rights reserved.
//

import Foundation;
import UIKit; // info will be placed inside a UIView

struct Tiger {
    
    // info will be supplied when instantiated
    var age = 0;
    var name = "";
    var breed = "";
    var picture = UIImage(named:"");
    
    func chuff() -> Void {
        println("Tiger: CHUFF CHUFF, MUDAFUCKA");
    }
    
    func chuffNTimes (nTimes: Int) -> Void {
        for i in 0...nTimes {
            println("Tiger: CHUFF CHUFF #\(i + 1), MUDAFUCKA");
        }
    }
    
}