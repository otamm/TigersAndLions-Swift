//
//  ViewController.swift
//  TigersAndLions
//
//  Created by Otavio Monteagudo on 5/28/15.
//  Copyright (c) 2015 Otavio Monteagudo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainImageView: UIImageView! ;
    @IBOutlet weak var nameLabel: UILabel! ;
    @IBOutlet weak var ageLabel: UILabel! ;
    @IBOutlet weak var breedLabel: UILabel! ;
    var tigers:Array<Tiger> = []; // globally accessed only when defined outside a method

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var tiger = Tiger(); //struct Tiger defined in Tiger.swift
        tiger.age = 3;
        tiger.name = "Hobbes";
        tiger.breed = "Cotton, Made in China";
        tiger.picture = UIImage(named:"hobbes.jpeg");
        
        var anotherTiger = Tiger();
        anotherTiger.age = 0;
        anotherTiger.name = "Ty";
        anotherTiger.breed = "Common tiger, dunno the breed's name LOL";
        anotherTiger.picture = UIImage(named: "baby.jpeg");
        
        var yetAnotherTiger = Tiger();
        yetAnotherTiger.age = 2;
        yetAnotherTiger.name = "Tigress";
        yetAnotherTiger.breed = "3D Digital Animation";
        yetAnotherTiger.picture = UIImage(named: "tigress_by_jona.jpg");
        
        tigers.append(tiger);
        tigers.append(anotherTiger);
        tigers.append(yetAnotherTiger);
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextBarBtnPressed(sender: AnyObject) {
        let randomIndex = Int(arc4random_uniform(UInt32(tigers.count)));
        let tiger = tigers[randomIndex];
        
        nameLabel.text = tiger.name;
        ageLabel.text = "\(tiger.age)";
        breedLabel.text = tiger.breed;
        mainImageView.image = tiger.picture;
    }

}

