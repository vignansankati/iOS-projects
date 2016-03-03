//
//  MathTeacher.swift
//  Sankati_Tabberific
//
//  Created by Sankati,Vignan on 2/9/16.
//  Copyright © 2016 Sankati,Vignan. All rights reserved.
//
//  Tested in iphone5s

import Foundation

class MathTeacher {
    //Initialization of operands and operator
    var operand1:Int = 1
    var operand2:Int = 1
    var maximumProblemSize:Int = 9
    var history:String = ""
    var operation:OperationType = .Plus
    
    enum OperationType {
        case Plus
        case Minus
    }
    
    //Creation of new problem
    func makeNewProblem() -> Int {
        return random() % maximumProblemSize+1;
    }
    
    
    //Checking whether answer is correct or not
    func answerIsCorrect(result:Int) -> Bool {
        
        //When operation is plus
        if operation == OperationType.Plus {
            if operand1 + operand2 == result {
                return true
            }
            else {
                return false
            }
        }
        
        //When operation is minus
        else {
            if operand1 - operand2 == result {
                return true
            }
            else {
                return false
            }
        }
    }
    
}