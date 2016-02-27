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
    
    
    @IBOutlet weak var mainLikeBarOutlet: MainPercentageBar!
 


    @IBOutlet weak var mainDislikeBarOutlet: MainDislikeBar!
    
    var textOne = String()
    
    //probably have to subtract constraint, hard fix for now
   // let barLength = UIScreen.mainScreen().bounds.size.width - 100
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         locationName.text = textOne + " High School"
        
        let barLength = UIScreen.mainScreen().bounds.size.width - 100
        
        let randGenForCurrentPointsPercentage:Float = Float(Float(99 - Int(arc4random_uniform(40)))/100)
        print("randgen")
        print(randGenForCurrentPointsPercentage)
        
        
        let diceRoll = Int(arc4random_uniform(6))
        
        var pointsNeeded = ["1000", "2500", "6000", "10000", "15000", "20000"];
        
        var rewards = ["Reward 0", "Reward 1", "Reward 2", "Reward 3", "Reward 4", "Reward 5"]
        
        
       
        // Do any additional setup after loading the view.
        currentPoints = Int(randGenForCurrentPointsPercentage * Float(pointsNeeded[diceRoll])!)
        let pointsRemaining = Int(pointsNeeded[diceRoll])! - currentPoints

        points.text = "Current Points: " + String(currentPoints)
        requiredPoints.text = "Points Needed: " + pointsNeeded[diceRoll]
        rewardText.text = rewards[diceRoll]
        
        
     
        
        //Make the ratings
        
        //controls the size of the Bar
        
        let imageSizeGreenBar = CGSize(width: 3000 * currentPoints / Int((pointsNeeded[diceRoll]))!, height: 20)
        
        let imageSizeRedBar = CGSize(width: 3000 * pointsRemaining / Int((pointsNeeded[diceRoll]))!, height: 20)
        
        
        
        let mainDislikeBarLength = (Int) (barLength) * pointsRemaining/Int((pointsNeeded[diceRoll]))!
        
        //test line
        
        // x and y =100 .... frame: CGRect(origin: CGPoint(x: 100, y: 100), size: imageSizeGreenBar
        
        //Where the frames are changed
        
        mainLikeBarOutlet.frame = CGRectMake(
            mainLikeBarOutlet.frame.origin.x,
            mainLikeBarOutlet.frame.origin.y, CGFloat(Int (barLength) * currentPoints/Int((pointsNeeded[diceRoll]))!), mainLikeBarOutlet.frame.height);
        
        
        // CGFloat(Int (barLength) * totalDislikes/totalVotes)
        mainDislikeBarOutlet.frame = CGRectMake(mainDislikeBarOutlet.frame.origin.x, mainDislikeBarOutlet.frame.origin.y, barLength, mainDislikeBarOutlet.frame.height)

        //Create views
        
        let mainLikeBar = MainPercentageBar(frame: mainLikeBarOutlet.frame)
        
        //MainRatingsBar(fram
        
        
        let mainDislikeBar = MainDislikeBar(frame: mainDislikeBarOutlet.frame)
        
        self.view.addSubview(mainDislikeBar)
        self.view.addSubview(mainLikeBar)
        
        let redBar = drawCustomImage(imageSizeRedBar, fillColor: UIColor.redColor().CGColor)
        mainDislikeBar.image = redBar
        
        let greenBar = drawCustomImage(imageSizeGreenBar, fillColor: UIColor.greenColor().CGColor)
        mainLikeBar.image = greenBar

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func drawCustomImage(size: CGSize, fillColor: CGColor) -> UIImage {
        // Setup our context
        let bounds = CGRect(origin: CGPoint.zero, size: size)
        let opaque = false
        let scale: CGFloat = 0
        
        
        UIGraphicsBeginImageContextWithOptions(size, opaque, scale)
        let context = UIGraphicsGetCurrentContext()
        
        // Setup complete, do drawing here
        CGContextSetStrokeColorWithColor(context, UIColor.blackColor().CGColor)
        CGContextStrokeRect(context, bounds)
        CGContextSetLineWidth(context, 2.0)
        
        //Fills in the rectangular with color specified above
        CGContextSetFillColorWithColor(context, fillColor)
        CGContextSetStrokeColorWithColor(context, fillColor)
        CGContextFillRect(context, bounds)
        
        
        // Drawing complete, retrieve the finished image and cleanup
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
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
