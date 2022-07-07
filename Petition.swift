//
//  Petition.swift
//  Whitehouse Petitions
//
//  Created by Admin on 7/6/22.
//

import Foundation

struct Petitions : Codable {
    let results : [Petition]
}

struct Petition : Codable {
    let title : String
    let body : String
    let signatureCount : Int
}
