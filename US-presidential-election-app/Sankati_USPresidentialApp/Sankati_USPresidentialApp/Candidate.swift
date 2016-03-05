//
//  Candidate.swift
//  Sankati_USPresidentialApp
//
//  Created by Sankati,Vignan on 2/22/16.
//  Copyright © 2016 Sankati,Vignan. All rights reserved.
//  Tested in iPhone 5s
//

import Foundation
import UIKit

class Candidate {
    var candidateName:String
    var numberOfVotes:Int
    var candidateImage:UIImage
    
    init(candidateName:String,numberOfVotes:Int,candidateImage:UIImage) {
        self.candidateName = candidateName
        self.numberOfVotes = numberOfVotes
        self.candidateImage = candidateImage
    }
    
}