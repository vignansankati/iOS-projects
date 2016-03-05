//
//  ViewController.swift
//  Sankati_USPresidentialApp
//
//  Created by Sankati,Vignan on 2/22/16.
//  Copyright © 2016 Sankati,Vignan. All rights reserved.
//  Tested in iPhone 5s
//

import UIKit

class CandidateViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //object of type PollFactory
//    var pollFactory:PollFactory = PollFactory()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //creating instances of parties by invoking create model
        PollFactory.createModel()
        // Do any additional setup after loading the view, typically from a nib.
    }
     
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Function to return number of sections
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return PollFactory.parties.count
    }
    
    //Function to provide the title of the section
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return PollFactory.parties[section].partyName
    }
    
    //Function to returmn number of cells of each section
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PollFactory.parties[section].partyDictionary.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //candidatesArray of type candidate
        var candidatesArray:[Candidate] = []
        
        candidatesArray = PollFactory.parties[indexPath.section].displayOrder()
        //declaring the cell type
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        //tagging the cells with their tags
        let nameLbl:UILabel = cell.viewWithTag(200) as! UILabel
        let voteLbl:UILabel = cell.viewWithTag(300) as! UILabel
        let imageView  = cell.viewWithTag(97) as! UIImageView
        
        
        for candidate:Candidate in PollFactory.parties[indexPath.section].partyDictionary.values {
            candidatesArray.append(candidate)
        }
        //candidate name label
        nameLbl.text = candidatesArray[indexPath.row].candidateName
        //number of votes label
        voteLbl.text = "\(PollFactory.parties[indexPath.section].getPercentage(candidatesArray[indexPath.row].candidateName))"
        //imageView of the candidate
        imageView.image = candidatesArray[indexPath.row].candidateImage
        
        return cell
    }
    
    //This function gets executed after tapping the cell of Table view
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let object =  PollFactory.parties[indexPath.section].displayOrder()[indexPath.row]
        
        PollFactory.parties[indexPath.section].updateVote(object.candidateName)
        tableView.reloadData()
    }
}

