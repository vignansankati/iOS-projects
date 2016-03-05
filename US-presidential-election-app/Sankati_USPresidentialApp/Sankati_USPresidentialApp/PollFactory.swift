//
//  PollFactory.swift
//  Sankati_USPresidentialApp
//
//  Created by Sankati,Vignan on 2/22/16.
//  Copyright © 2016 Sankati,Vignan. All rights reserved.
//  Tested in iPhone 5s
//

import Foundation
import UIKit

class PollFactory {
    
    static var parties:[Party] = []
    
    static func createModel() {
        //Declaration of democratparty and republican party variables of type Party
        let democratParty:Party = Party(partyName: "Democrat",partyDictionary: ["Hillary":Candidate(candidateName: "Hillary", numberOfVotes: 0, candidateImage: UIImage(imageLiteral: "clinton.jpg"))])
        let repulicanParty:Party = Party(partyName: "Republican",partyDictionary: ["Carson":Candidate(candidateName: "Carson", numberOfVotes: 0, candidateImage: UIImage(imageLiteral: "bencarson.jpg"))])
        
        //Appending the candidates to the respective parties
        democratParty.addCandidate(Candidate(candidateName: "Sanders", numberOfVotes: 0, candidateImage: UIImage(imageLiteral: "berniesanders.jpg")))

        repulicanParty.addCandidate(Candidate(candidateName: "Ted Cruz", numberOfVotes: 0, candidateImage: UIImage(imageLiteral: "TedCruz.jpg")))
        repulicanParty.addCandidate(Candidate(candidateName: "Trump", numberOfVotes: 0, candidateImage: UIImage(imageLiteral: "trump.jpg")))
        
        parties.append(democratParty)
        parties.append(repulicanParty)
        
    }
}