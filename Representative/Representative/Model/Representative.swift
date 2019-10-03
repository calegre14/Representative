//
//  Representative.swift
//  Representative
//
//  Created by Christopher Alegre on 10/3/19.
//  Copyright © 2019 Christopher Alegre. All rights reserved.
//

import Foundation

struct TopLevelRepresentative: Decodable {
        
    let results: [ResultDictionary]
}

struct ResultDictionary: Decodable {
    
    let name: String
    let party: String
    let state: String
    let district: String
    let phone: String
    let office: String
    let link: String
}
