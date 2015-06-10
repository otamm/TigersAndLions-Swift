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
    var lions:[Lion] = []; // same.
    var lionCubs:[LionCub] = [];
    
    var animations:Array<UIViewAnimationOptions> = [
        UIViewAnimationOptions.TransitionCrossDissolve,
        UIViewAnimationOptions.TransitionCurlDown, UIViewAnimationOptions.TransitionFlipFromLeft,
        UIViewAnimationOptions.TransitionFlipFromTop
    ];
    
    // indexes
    var tigerIndex:Int = 0;
    var tigerFactIndex:Int = 0;
    var lionIndex:Int = 0;
    var lionFactIndex:Int = 0;
    var animationIndex:Int = 0;
    
    //global lion variable
    var lion:Lion = Lion();

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
        tigerFactIndex = Int(arc4random_uniform(UInt32(2)));
        // displays tiger info when UIView loads;
        //nameLabel.text = tigers[tigerIndex].name;
        //ageLabel.text = "\(tigers[tigerIndex].age)";
        //breedLabel.text = tigers[tigerIndex].breed;
        //mainImageView.image = tigers[tigerIndex].picture;
        
        //randomFact.text = self.getRandomFactsTiger(tigerFactIndex);
        tigers[tigerIndex].chuff();
        
        // adding lions
        var lioness = Lion();
        lioness.age = 3;
        lioness.isAlphaMale = false;
        lioness.image = UIImage(named: "lioness-picture.jpg");
        lioness.name = "Sarabi Lioness";
        lioness.subspecies = "Barbary";
        
        self.lions += [lioness];
        
        var lion = Lion();
        lion.age = 6;
        lion.isAlphaMale = false;
        lion.image = UIImage(named: "lawyer_lion_by_waymonds.jpg");
        lion.name = "Lawyer Lion";
        lion.subspecies = "Viper";
        
        var emoSimba = LionCub();
        emoSimba.age = 1;
        emoSimba.isAlphaMale = false;
        emoSimba.image = UIImage(named: "emogothpunk_simba.png");
        emoSimba.name = "Emo Goth Punk Simba";
        emoSimba.subspecies = "It's Simba, duh";
        emoSimba.isSimba = true;
        
        self.lionCubs += [emoSimba];
        lionFactIndex = Int(arc4random_uniform(UInt32(2)));
        
        var lORt = Int(arc4random_uniform(UInt32(2)));
        
        if (lORt == 1) {
            self.updateUIViewWithTiger();
        } else {
            self.updateUIViewWithLion();
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // will get the facts out of a method. Learning exercise as it could just be an array.
    func getRandomFactsTiger(lastUsedIndex: Int) -> String {
        
        let randomFacts = [
            "The Tiger is the biggest species in the cat family",
            "Tigers can reach a length of 3.3 meters",
            "A group of tigers is known as an 'ambush' or 'streak'"
        ];
        
        var newIndex:Int = Int(arc4random_uniform(UInt32(randomFacts.count)));
        
        while (newIndex == lastUsedIndex) {
            newIndex = Int(arc4random_uniform(UInt32(randomFacts.count)));
        }
        
        self.tigerFactIndex = newIndex;
        return randomFacts[newIndex];
    }
    
    func getRandomFactsLion(lastUsedIndex: Int, lion: LionCub) -> String {
        
        var randomFacts = [
            "This is a lion.",
            "Female Lionesses form the stable social unit and do not tolerate outside females.",
            "This lion is NOT simba.",
            "Cubs are usually hidden in the dense bush for approximately six weeks.",
            "Cubs begin eating meat at about the age of six weeks"
            
        ];
        
        if (lion.isAlphaMale) {
            randomFacts += ["Male lions are easy to recognize thanks to their distinctive manes. Males with darker manes are more likely to attract females."];
        }
        
        
        var newIndex:Int = Int(arc4random_uniform(UInt32(randomFacts.count)));
        
        while (newIndex == lastUsedIndex) {
            newIndex = Int(arc4random_uniform(UInt32(randomFacts.count)));
        }
        
        if (newIndex == 2 && lion.isSimba) {
            randomFacts[2] = "This lion IS simba.";
        }
        
        self.lionFactIndex = newIndex;
        return randomFacts[newIndex];
    }
    
    // method has the same identifier but a different signature as the one above.
    func getRandomFactsLion(lastUsedIndex: Int, lion: Lion) -> String {
        
        var randomFacts = [
            "This is a lion.",
            "Female Lionesses form the stable social unit and do not tolerate outside females.",
            "This lion is NOT simba."
        ];
        
        if (lion.isAlphaMale) {
            randomFacts += ["Male lions are easy to recognize thanks to their distinctive manes. Males with darker manes are more likely to attract females."];
        }
        
        var newIndex:Int = Int(arc4random_uniform(UInt32(randomFacts.count)));
        
        while (newIndex == lastUsedIndex) {
            newIndex = Int(arc4random_uniform(UInt32(randomFacts.count)));
        }
        
        self.lionFactIndex = newIndex;
        return randomFacts[newIndex];
    }
    
    // randomly changes a lion to alpha male.
    func turnAlphaMale(lion: Lion) -> Void {
        
    }
    
    func updateUIViewWithTiger() {
        
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
                self.randomFact.text = self.getRandomFactsTiger(self.tigerFactIndex);
            }, completion: { (finished: Bool) -> () in
                tiger.chuffNTimes(randomIndex);
                println(" THIS TIGER'S AGE IS \(tiger.age), ITS AGE IN HUMAN YEARS ISSSS \(tiger.ageInTigerYear(tiger.age))");
        } );
        
    }
    
    func updateUIViewWithLion() {
        var randomIndex = Int(arc4random_uniform(UInt32(lions.count + lionCubs.count)));
        var dispCub:Int = 0; // will subtract from the index, displaying a cub when it's the case. Used to maintain full randomness.
        
        // assures the random index to be different than the current.
        while (lionIndex == randomIndex)
        {
            randomIndex = Int(arc4random_uniform(UInt32(lions.count + lionCubs.count)));
        }
        
        if (randomIndex >= lions.count) {
            dispCub = (lions.count);
            self.lion = self.lionCubs[randomIndex - dispCub];
        } else {
            self.lion = self.lions[randomIndex];
        }
        
        lionIndex = randomIndex;
        // assures a different animation each time
        var randomIndex2 = Int(arc4random_uniform(UInt32(animations.count)));
        
        while (animationIndex == randomIndex2)
        {
            randomIndex2 = Int(arc4random_uniform(UInt32(animations.count)));
        }
        animationIndex = randomIndex2;
        
        
        // assures a different fact each time
        
        UIView.transitionWithView(self.view, duration: 1, options: animations[animationIndex], animations:
            {
                self.nameLabel.text = self.lion.name;
                self.ageLabel.text = "\(self.lion.age)";
                self.breedLabel.text = self.lion.subspecies;
                self.mainImageView.image = self.lion.image;
                self.randomFact.text = self.getRandomFactsLion(self.lionFactIndex,lion: self.lion);
            }, completion: { (finished: Bool) -> () in
                self.lion.roarNTimes(randomIndex);
                println(" THIS LION'S AGE IS \(self.lion.age), ITS AGE IN HUMAN YEARS ISSSS \(self.lion.ageInLionYear(self.lion.age))");
        } );
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
        
        var lionORtiger = Int(arc4random_uniform(UInt32(2)));
        
        if (lionORtiger == 1) {
            self.updateUIViewWithTiger();
        } else {
            self.updateUIViewWithLion();
        }
        
    }

}

