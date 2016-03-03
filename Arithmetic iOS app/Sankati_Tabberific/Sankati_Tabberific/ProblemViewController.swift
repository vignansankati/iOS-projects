//
//  ProblemsViewController.swift
//  Sankati_Tabberific
//
//  Created by Sankati,Vignan on 2/9/16.
//  Copyright © 2016 Sankati,Vignan. All rights reserved.
//  Tested in iphone5s
//

import UIKit

class ProblemViewController: UIViewController, UITextFieldDelegate {
    
    var mathTeacher : MathTeacher!
    
    @IBOutlet weak var operand1LBL: UILabel!
    
    @IBOutlet weak var operationLBL: UILabel!
    
    @IBOutlet weak var operand2LBL: UILabel!
    
    @IBOutlet weak var resultTF: UITextField!
    
    
    //action for checing the answer entered
    @IBAction func checkAnswer(sender: UIButton) {
        
        let answer:Int! = Int(resultTF.text!)
        //if result textbox is null then error box is shown
        if answer == nil {
            displayAlertControllerWithTitle("Input", message: "Please enter any numerical value")
        }
        //if the result text box is not null then this gets executed
        else {
            let checkAnswerBool:Bool = mathTeacher.answerIsCorrect(answer)
            if(checkAnswerBool == false) {
                displayAlertControllerWithTitle("Oops !!!", message: "Sorry answer is wrong")
            }
            else {
                displayAlertControllerWithTitle("Congrats !!!", message: "Yeah that's right")
            }
            let historyViewController = (self.tabBarController?.viewControllers![1] as! HistoryViewController)
            historyViewController.viewDidLoad()
            //appending operands and operators to mathteacher history
            mathTeacher.history.appendContentsOf("\(mathTeacher.operand1) \(operationLBL.text!) \(mathTeacher.operand2) = \(resultTF.text!); \(checkAnswerBool) \n")
        }
        
    }
    
    //function to create a new problem
    @IBAction func makeNewProblem(sender: UIButton) {
        // settigns view controller object creation
        let settingsViewController = (self.tabBarController?.viewControllers![2] as! SettingsViewController)
        
        //checking for settings controller textbox for having nil
        if settingsViewController.maximumProblemSizeTF != nil {
            if let max = Int(settingsViewController.maximumProblemSizeTF.text!)  {
                self.mathTeacher.maximumProblemSize = max
            }
            else {
                self.mathTeacher.maximumProblemSize = 9
            }
        }
        
        mathTeacher.operand1 = mathTeacher.makeNewProblem()
        mathTeacher.operand2 = mathTeacher.makeNewProblem()
        
        self.operand1LBL.text = mathTeacher.operand1.description
        self.operand2LBL.text = mathTeacher.operand2.description
        self.resultTF.text = ""
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
    }
    
    //alert box
    func displayAlertControllerWithTitle(title:String, message:String) {
        let uiAlertController:UIAlertController = UIAlertController(title: title,
            message: message, preferredStyle: UIAlertControllerStyle.Alert)
        uiAlertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel,
            handler:{(action:UIAlertAction)->Void in }))
        self.presentViewController(uiAlertController, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let appDel = UIApplication.sharedApplication().delegate as! AppDelegate
        mathTeacher = appDel.mathTeacher
        resultTF.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool // called when 'return' key pressed. return NO to ignore.
    {
        resultTF.resignFirstResponder()
        return true;
    }
    
    
}

