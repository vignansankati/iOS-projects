//
//  SettingsViewController.swift
//  Sankati_Botanical App
//
//  Created by Sankati,Vignan on 3/31/16.
//  Copyright © 2016 Sankati,Vignan. All rights reserved.
//  compiled in iPhone6s

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var colorSC: UISegmentedControl!
    @IBOutlet weak var raindropsTF: UITextField!
    @IBOutlet weak var radiusSlider: UISlider!
    
    var rainVC:RainViewController!
    var colorDictionary:[String:UIColor] = ["Red":UIColor.redColor(),"Orange":UIColor.orangeColor(),"Yellow":UIColor.yellowColor(),"Green":UIColor.greenColor(),"Blue":UIColor.blueColor(),"Violet":UIColor.purpleColor()]
    
    @IBAction func done(sender: AnyObject) {
        
        rainVC.raindropColor = colorDictionary[colorSC.titleForSegmentAtIndex(colorSC.selectedSegmentIndex)!]!
        rainVC.raindropRadius = Float(radiusSlider.value)
        if Int(raindropsTF.text!) != nil &&  Int(raindropsTF.text!) >= 0  {
            rainVC.numberOfRaindrops = Int(raindropsTF.text!)!
        }
        else {
            displayAlertControllerWithTitle("Error", message: "Please provide a value for rain drop radius")
        }
        self.dismissViewControllerAnimated(true, completion: nil);
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func displayAlertControllerWithTitle(title:String, message:String) {
        let uiAlertController:UIAlertController = UIAlertController(title: title,
            message: message, preferredStyle: UIAlertControllerStyle.Alert)
        uiAlertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel,
            handler:{(action:UIAlertAction)->Void in }))
        self.presentViewController(uiAlertController, animated: true, completion: nil)
        
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
