//
//  University.swift
//  The Fine Faculty Finder
//
//  Created by Michael Rogers on 2/23/16.
//  Copyright © 2016 Michael Rogers. All rights reserved.
//

import Foundation
import UIKit

/* A Model class used to represent a university.
A University consists of multiple Departments, represented by the departments array.
*/

class University {
    
    var departments:[Department]!
    var url:String = "https://dl.dropboxusercontent.com/u/19400137/TheMultiverse/44-443-s16/University.json"
    
    init(){
        self.departments = []
    }

    /* Goes out to the designated url, downloads the */
    func populateUniversity(){
        let defaultConfigObject:NSURLSessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session:NSURLSession = NSURLSession(configuration: defaultConfigObject, delegate: nil, delegateQueue: NSOperationQueue.mainQueue())
        
        session.dataTaskWithURL( NSURL(string: url)!, completionHandler: {(data:NSData?,response:NSURLResponse?,error:NSError?)->Void in
            var departments:[AnyObject]!
            do {
                try departments = NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as! [AnyObject]
                for dept in departments {
                    let departmentName = dept["name"]!! as! String
                    var fineFaculty:[Professor] = []
                    let primaryBuilding = dept["primaryBuilding"]!! as! String
                   
                    for prof in dept["faculty"] as! [AnyObject] {
                        let firstName = prof["firstName"]!! as! String
                        let lastName = prof["lastName"]!! as! String
                        let office = prof["office"]!! as! String
                        let officeHours = prof["officeHours"]!! as! String
                        let facultyInFormation = Professor(firstName: firstName, lastName: lastName, office: office, officeHours:officeHours, image: UIImage())
                        fineFaculty.append(facultyInFormation)
                    }
                    
                     let departmentInFormation = Department(name: departmentName, faculty: fineFaculty, primaryBuilding: primaryBuilding)
                    self.departments.append(departmentInFormation)
                }
                NSNotificationCenter.defaultCenter().postNotificationName("Data Delivered", object: nil)
            }catch {
                let blamees:[String] = ["Dennis", "Michael", "Charles"]
                print("Something has gone wrong -- I think we'll blame it on \(blamees[random()%blamees.count])")
            }
            
            }).resume()
        
        
    
    }
}

