//
//  ViewController.swift
//  Sankati_FacultyFinder
//
//  Created by Sankati,Vignan on 3/4/16.
//  Copyright © 2016 Sankati,Vignan. All rights reserved.
//  Compiled in iPhone 4s

import UIKit

class ProfessorInfoViewController: UIViewController {

    
    var professor:Professor!
    
    //labels for Office location and Office hours
    @IBOutlet weak var office:UILabel!
    @IBOutlet weak var officeHours:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // setting the title of the table view
        self.title = "\(professor.firstName) \(professor.lastName)"
        
        //Assigning the values to the labels
        office.text = "Office: \(professor.office)"
        officeHours.text = "Office hours: \(professor.officeHours)"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

