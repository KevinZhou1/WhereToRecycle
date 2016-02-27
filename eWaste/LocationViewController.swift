//
//  LocationViewController.swift
//  eWaste
//
//  Created by Kevin Zhou on 2/26/16.
//  Copyright © 2016 Kevin Zhou. All rights reserved.
//

import UIKit

class LocationViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    
    @IBOutlet weak var pickerView: UIPickerView!
    
    
    var pickerDataSource = ["Amherst", "Belchertown", "Pelham", "Northhampton", "Hadley", "Leverett", "Sunderland", "Hatfield", "Holyoke"];
    
    var row = Int();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerDataSource.sortInPlace()
        self.pickerView.dataSource = self;
        self.pickerView.delegate = self;

        // Do any additional setup after loading the view.
        row = pickerView.selectedRowInComponent(0)
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let DestViewController : PointsViewController  = segue.destinationViewController as! PointsViewController
        
        //Initialize the text fields in the other view
        DestViewController.textOne = pickerDataSource[pickerView.selectedRowInComponent(0)]
        
        
        
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count;
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return pickerDataSource[row]
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
