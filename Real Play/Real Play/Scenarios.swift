//
//  Scenarios.swift
//  Real Play
//
//  Created by Braden Casperson on 7/27/17.
//  Copyright © 2017 Braden Casperson. All rights reserved.
//

import Foundation

public struct Scenarios {
    
    public var people : [[String: Any]]
    public var places : [[String: Any]]
    public var concerns : [[String: Any]]
    
    /**
     Constructs the object based on the given dictionary.
     
     Usage:
     let scenario = Scenarios(someDictionaryFromJSON)
     
     - parameter dictionary:  NSDictionary from JSON.
     
     - returns: Scenarios Instance.
     */
    public init?(json: [String: Any]) {
        guard let scenarios = json["scenarios"] as? [String: Any],
        let people = scenarios["people"] as? [[String: Any]],
        let places = scenarios["places"] as? [[String: Any]],
        let concerns = scenarios["concerns"] as? [[String: Any]] else {
            return nil
        }
        
        self.people = people
        self.places = places
        self.concerns = concerns
        
    }
}

