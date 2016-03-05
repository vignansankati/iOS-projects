//
//  Party.swift
//  Sankati_USPresidentialApp
//
//  Created by Sankati,Vignan on 2/22/16.
//  Copyright © 2016 Sankati,Vignan. All rights reserved.
//  Tested in iPhone 5s
//

import Foundation
import UIKit

class Party {
    var partyName:String!
    var partyDictionary:[String:Candidate]!
    
    
    init(partyName:String,partyDictionary:[String:Candidate]) {
        self.partyName = partyName
        self.partyDictionary = partyDictionary
    }
    
    
    //Function to sort candidates
    func displayOrder() -> [Candidate] {
        var partyArray:[Candidate] = []
        for candidate:Candidate in partyDictionary.values {
            partyArray.append(candidate)
        }
        partyArray.sortInPlace({$0.numberOfVotes > $1.numberOfVotes})
        return partyArray
    }
    
    
    //Function to calculate percentage
    func getPercentage(candidateName:String) -> Double {
        var total:Int = 0
        var percentage:Double = 0
        for candidate:Candidate in partyDictionary.values {
            total += candidate.numberOfVotes
        }
        if total > 0 {
            percentage = Double((partyDictionary[candidateName]!.numberOfVotes))/Double(total) * 100
            percentage = round (100*percentage)/100
        }
        return percentage
    }
    
    
    //Function to increment the number of votes
    func updateVote(candidateName:String) {
        partyDictionary[candidateName]?.numberOfVotes++
    }
    
    //Function to add a candidate to the dictionary
    func addCandidate(candidate:Candidate) {
        partyDictionary[candidate.candidateName] = candidate
    }
}


//func displayOrder() -> [Candidate]{
//    var candidatesArray:[Candidate] = []
//    for value in partiesCandidatesDictionary.values {
//        candidatesArray.append(value)
//    }
//    candidatesArray.sortInPlace({$0.numberOfVotes>$1.numberOfVotes})
//    
//    return candidatesArray
//}