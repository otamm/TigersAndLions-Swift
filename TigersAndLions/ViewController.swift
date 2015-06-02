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
    var tigers:Array<Tiger> = []; // globally accessed, filled with content after ViewDidLoad()
    var animations:Array<UIViewAnimationOptions> = [];

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
        
        // a 'closure': "Closures are self-contained blocks of functionality that can be passed around and used in your code. Closures in Swift are similar to blocks in C and Objective-C and to lambdas in other programming languages."
        // "Closures can capture and store references to any constants and variables from the context in which they are defined. This is known as closing over those constants and variables, hence the name “closures”. Swift handles all of the memory management of capturing for you."
        
        //UIView.transitionWithView(view: UIView, duration: NSTimeInterval, options: UIViewAnimationOptions, animations: () -> Void, completion: ((Bool) -> Void)?)
        
        // .transitionWithView(), class method of 'UIView'; parameters:
        // view: the 'view' attribute of the the container view that performs the transition.        
        // duration: The duration of the transition animation, measured in seconds. If you specify a negative value or 0, the transition is made without animations.
        // options: A mask of options indicating how you want to perform the animations. For a list of valid constants, see UIViewAnimationOptions.
        // animations: A block object that contains the changes you want to make to the specified view. This block takes no parameters and has no return value. This parameter must not be NULL.
        // completion: A block object to be executed when the animation sequence ends. This block has no return value and takes a single Boolean argument that indicates whether or not the animations actually finished before the completion handler was called. If the duration of the animation is 0, this block is performed at the beginning of the next run loop cycle. This parameter may be NULL.
        var tigerzzz:[Tiger] = tigers;
        let randomIndex = Int(arc4random_uniform(UInt32(tigers.count)));
        //tigerzzz.removeAtIndex()
        let tiger = tigerzzz[randomIndex];
        
        UIView.transitionWithView(self.view, duration: 1, options: UIViewAnimationOptions.TransitionCrossDissolve, animations:
            {
                self.nameLabel.text = tiger.name;
                self.ageLabel.text = "\(tiger.age)";
                self.breedLabel.text = tiger.breed;
                self.mainImageView.image = tiger.picture;
            }, completion: { (finished: Bool) -> () in } );

    }

}

