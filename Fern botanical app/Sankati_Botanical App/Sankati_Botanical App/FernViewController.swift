//
//  SecondViewController.swift
//  Sankati_Botanical App
//
//  Created by Sankati,Vignan on 3/31/16.
//  Copyright © 2016 Sankati,Vignan. All rights reserved.
//  compiled in iPhone6s

import UIKit

class FernViewController: UIViewController {

    @IBOutlet weak var fernView: FernView!
    var fernMaker:FernMaker!
    
    
    override func viewDidLoad() {
        fernMaker = FernMaker()
        fernMaker.generateFern(5000)
        fernView.fernMaker = fernMaker
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

