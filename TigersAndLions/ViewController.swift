//
//  ViewController.swift
//  TigersAndLions
//
//  Created by Otavio Monteagudo on 5/28/15.
//  Copyright (c) 2015 Otavio Monteagudo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // elements linked from storyboard
    @IBOutlet weak var mainImageView: UIImageView! ;
    @IBOutlet weak var nameLabel: UILabel! ;
    @IBOutlet weak var ageLabel: UILabel! ;
    @IBOutlet weak var breedLabel: UILabel! ;
    @IBOutlet weak var randomFact: UILabel! ;
    
    // arrays, one for the tigers, other for the possible animations
    
    var tigers:Array<Tiger> = []; // globally accessed, filled with content after ViewDidLoad()
    var animations:Array<UIViewAnimationOptions> = [
        UIViewAnimationOptions.TransitionCrossDissolve,
        UIViewAnimationOptions.TransitionCurlDown, UIViewAnimationOptions.TransitionFlipFromLeft,
        UIViewAnimationOptions.TransitionFlipFromTop
    ];
    
    // indexes
    var tigerIndex:Int = 0;
    var animationIndex:Int = 0;
    var factIndex:Int = 0;

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
        
        // fill array with available tigers
        tigers.append(tiger);
        tigers.append(anotherTiger);
        tigers.append(yetAnotherTiger);
        
        // randomizes first tiger to be displayed;
        tigerIndex = Int(arc4random_uniform(UInt32(tigers.count)));
        
        // without this line, the animation at index 0 would never be the first, the process was 75% randomized; now it is 100%.
        animationIndex = Int(arc4random_uniform(UInt32(animations.count)));
        
        // factIndex will be set at either 0 or 1, so if the total number of facts exceeds 2, the first two in the array will have a smaller probability of being shown first.
        factIndex = Int(arc4random_uniform(UInt32(2)));
        // displays tiger info when UIView loads;
        nameLabel.text = tigers[tigerIndex].name;
        ageLabel.text = "\(tigers[tigerIndex].age)";
        breedLabel.text = tigers[tigerIndex].breed;
        mainImageView.image = tigers[tigerIndex].picture;
        
        randomFact.text = self.getRandomFacts(factIndex);
        tigers[tigerIndex].chuff();
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // will get the facts out of a method. Learning exercise as it could just be an array.
    func getRandomFacts(lastUsedIndex: Int) -> String {
        
        let randomFacts = [
            "The Tiger is the biggest species in the cat family",
            "Tigers can reach a length of 3.3 meters",
            "A group of tigers is known as an 'ambush' or 'streak'"
        ];
        
        var newIndex:Int = Int(arc4random_uniform(UInt32(randomFacts.count)));
        
        while (newIndex == lastUsedIndex) {
            newIndex = Int(arc4random_uniform(UInt32(randomFacts.count)));
        }
        
        self.factIndex = newIndex;
        return randomFacts[newIndex];
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
        
        var randomIndex = Int(arc4random_uniform(UInt32(tigers.count)));
        // assures the random index to be different than the current.
        while (tigerIndex == randomIndex)
        {
            randomIndex = Int(arc4random_uniform(UInt32(tigers.count)));
        }
        
        tigerIndex = randomIndex;
        // assures a different animation each time
        var randomIndex2 = Int(arc4random_uniform(UInt32(animations.count)));
        while (animationIndex == randomIndex2)
        {
            randomIndex2 = Int(arc4random_uniform(UInt32(animations.count)));
        }
        animationIndex = randomIndex2;
        
        let tiger = tigers[randomIndex];
        
        // assures a different fact each time
        
        UIView.transitionWithView(self.view, duration: 1, options: animations[animationIndex], animations:
            {
                self.nameLabel.text = self.tigers[self.tigerIndex].name;
                self.ageLabel.text = "\(self.tigers[self.tigerIndex].age)";
                self.breedLabel.text = self.tigers[self.tigerIndex].breed;
                self.mainImageView.image = self.tigers[self.tigerIndex].picture;
                self.randomFact.text = self.getRandomFacts(self.factIndex);
            }, completion: { (finished: Bool) -> () in
                tiger.chuffNTimes(randomIndex);
                println(" THIS TIGER'S AGE IS \(tiger.age), ITS AGE IN HUMAN YEARS ISSSS \(tiger.ageInTigerYear(tiger.age))");
            } );
        
    }

}

