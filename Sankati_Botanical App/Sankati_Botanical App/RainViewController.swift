//
//  FirstViewController.swift
//  Sankati_Botanical App
//
//  Created by Sankati,Vignan on 3/31/16.
//  Copyright © 2016 Sankati,Vignan. All rights reserved.
//  compiled in iPhone6s

import UIKit

class RainViewController: UIViewController {

    var raindropColor:UIColor = UIColor.redColor()
    var raindropRadius:Float = 1.0
    var numberOfRaindrops:Int = 70
    
    @IBOutlet weak var rainView: RainView!
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let se:SettingsViewController = segue.destinationViewController as? SettingsViewController {
            se.rainVC = self
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        rainView.rainVC = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {
        rainView.setNeedsDisplay()
        print(raindropRadius)
    }

}

