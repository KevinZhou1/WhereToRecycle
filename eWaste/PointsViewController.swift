//
//  PointsViewController.swift
//  eWaste
//
//  Created by Kevin Zhou on 2/26/16.
//  Copyright © 2016 Kevin Zhou. All rights reserved.
//

import UIKit



var currentPoints = Int()

class PointsViewController: UIViewController {

    //MARK: OUTLETS
    
    @IBOutlet weak var locationName: UILabel!
    
    
    @IBOutlet weak var points: UILabel!
    

    @IBOutlet weak var requiredPoints: UILabel!
    
    
    @IBOutlet weak var rewardText: UILabel!
    
    
    var textOne = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let randGenForCurrentPointsPercentage:Float = Float(Float(90 - Int(arc4random_uniform(30)))/100)
        print("randgen")
        print(randGenForCurrentPointsPercentage)
        
        
        let diceRoll = Int(arc4random_uniform(6))
        
        var pointsNeeded = ["1000", "2500", "6000", "10000", "15000", "20000"];
        
        var rewards = ["Reward 0", "Reward 1", "Reward 2", "Reward 3", "Reward 4", "Reward 5"]
        
        
        locationName.text = textOne + " High School"
        // Do any additional setup after loading the view.
        currentPoints = Int(randGenForCurrentPointsPercentage * Float(pointsNeeded[diceRoll])!)
        
        points.text = "Current Points: " + String(currentPoints)
        requiredPoints.text = "Points Needed: " + pointsNeeded[diceRoll]
        rewardText.text = rewards[diceRoll]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
