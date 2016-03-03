//
//  SecondViewController.swift
//  Sankati_Tabberific
//
//  Created by Sankati,Vignan on 2/9/16.
//  Copyright © 2016 Sankati,Vignan. All rights reserved.
//
//  Tested in iphone5s   

import UIKit

class HistoryViewController: UIViewController {

    var mathTeacher:MathTeacher!
    
    @IBOutlet weak var historyTV: UITextView!
    
    //appending the history of math teacher to history textview
    override func viewWillAppear(animated: Bool) {
        historyTV.text = mathTeacher.history
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let appDel = UIApplication.sharedApplication().delegate as! AppDelegate
        mathTeacher = appDel.mathTeacher
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

