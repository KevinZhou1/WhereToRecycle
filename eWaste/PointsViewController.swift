//
//  PointsViewController.swift
//  eWaste
//
//  Created by Kevin Zhou on 2/26/16.
//  Copyright © 2016 Kevin Zhou. All rights reserved.
//

import UIKit

class PointsViewController: UIViewController {

    //MARK: OUTLETS
    
    @IBOutlet weak var locationName: UILabel!
    
    var textOne = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationName.text = textOne + " High School"
        // Do any additional setup after loading the view.
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
