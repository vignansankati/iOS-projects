//
//  SecondViewController.swift
//  Sankati_Tabberific
//
//  Created by Sankati,Vignan on 2/9/16.
//  Copyright © 2016 Sankati,Vignan. All rights reserved.
//  Tested in iphone5s
//

import UIKit

class SettingsViewController: UIViewController,UITextFieldDelegate {
    
    var mathTeacher:MathTeacher!
    
    @IBOutlet weak var maximumProblemSizeTF: UITextField!
    
    @IBOutlet weak var operationSC: UISegmentedControl!
    
    
    //    action for segmented control
    @IBAction func operationSCBTN(sender: UISegmentedControl) {
        //problem view controller object
        let problemViewController = (self.tabBarController?.viewControllers![0] as! ProblemViewController)
        
        //checking for maximunm problem size textbox and assigning it to maximum problem size variable
        if Int(maximumProblemSizeTF.text!) != nil {
            mathTeacher.maximumProblemSize = Int(maximumProblemSizeTF.text!)!
            textFieldShouldReturn(maximumProblemSizeTF)
        }
        else {
//            displayAlertControllerWithTitle("Input !!!", message: "Please enter a numeric value")
        }
        
        //Operation to be performed when "-" is selected in segmented control
        if operationSC.selectedSegmentIndex == 1 {
            mathTeacher.operation = .Minus
            problemViewController.operationLBL.text = "-"
            
        }
            
        //Operation to be performed when "+" is selected in segmented control
        else {
            mathTeacher.operation = .Plus
            problemViewController.operationLBL.text = "+"
        }
        
        mathTeacher.operand1 = mathTeacher.makeNewProblem()
        mathTeacher.operand2 = mathTeacher.makeNewProblem()
        problemViewController.operand1LBL.text = mathTeacher.operand1.description
        problemViewController.operand2LBL.text = mathTeacher.operand2.description
        problemViewController.resultTF.text = ""
        
        
    }
    
    //alert box
    func displayAlertControllerWithTitle(title:String, message:String) {
        let uiAlertController:UIAlertController = UIAlertController(title: title,
            message: message, preferredStyle: UIAlertControllerStyle.Alert)
        uiAlertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel,
            handler:{(action:UIAlertAction)->Void in }))
        self.presentViewController(uiAlertController, animated: true, completion: nil)
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool // called when 'return' key pressed. return NO to ignore.
    {
        if Int(maximumProblemSizeTF.text!) == nil {
            displayAlertControllerWithTitle("Input", message: "Please provide any input")
        }
        
        maximumProblemSizeTF.resignFirstResponder()
        return true;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let appDel = UIApplication.sharedApplication().delegate as! AppDelegate
        mathTeacher = appDel.mathTeacher
        maximumProblemSizeTF.delegate = self
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

