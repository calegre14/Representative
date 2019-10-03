//
//  RepresentativeController.swift
//  Representative
//
//  Created by Christopher Alegre on 10/3/19.
//  Copyright © 2019 Christopher Alegre. All rights reserved.
// https://whoismyrepresentative.com/getall_mems.php?zip=31023&output=json

import UIKit

class RepresentativeController {
    
    struct StringConstants {
        fileprivate static let baseURL = "https://whoismyrepresentative.com"
        fileprivate static let gentallComp = "getall_reps_bystate.php"
        fileprivate static let stateQuery = "state"
        fileprivate static let outputKey = "output"
        fileprivate static let outputJSON = "json"
    }
    
    static func getZipCodeWith(zipCode: String, completion: @escaping ([ResultDictionary]) -> Void) {
        guard var url = URL(string: StringConstants.baseURL) else { completion([]); return }
        url.appendPathComponent(StringConstants.gentallComp)
        guard var components = URLComponents(url: url, resolvingAgainstBaseURL: true) else { completion([]); return }
        let zipCodeQuery = URLQueryItem(name: StringConstants.stateQuery, value: zipCode)
        let outputKeyQuery = URLQueryItem(name: StringConstants.outputKey, value: StringConstants.outputJSON)
        
        components.queryItems = [zipCodeQuery, outputKeyQuery]
        
        guard let finalURL = components.url else {
            print("Components have an issue")
            completion([])
            return }
        
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            if let error = error {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                completion([])
                return }
            
            guard let data = data else {
                print("Could not recieve data")
                completion([])
                return }
            
            let jsonDecoder = JSONDecoder()
            do {
                let searchJSON = try jsonDecoder.decode(TopLevelRepresentative.self, from: data)
                completion(searchJSON.results)
            } catch {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)") }
        } .resume()
    }
} //END OF CLASS
