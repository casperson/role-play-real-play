//
//  GameplayDataSource.swift
//  Real Play
//
//  Created by Braden Casperson on 7/27/17.
//  Copyright © 2017 Braden Casperson. All rights reserved.
//

import Foundation

class GameplayDataSource {
    
    var scenarios: Scenarios?
    private let bundle: Bundle
    private let filename: String
    
    init(filename: String = "dataSource.json", inBundle bundle: Bundle = Bundle.main) {
        self.bundle = bundle
        self.filename = filename
        parseScenarios()
    }
    
    private func scenarioData() -> Data? {
        
        guard let path = bundle.path(forResource: filename, ofType: nil), let data = NSData(contentsOfFile: path) else {
            return nil
        }
        
        return data as Data
    }
    
    func parseScenarios() {
        
        guard let data = scenarioData() else { return }
        do {
            let info = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
            scenarios = Scenarios(json: info)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func getAvailableScenarios() -> Scenarios {
        return scenarios!
    }
    
}

// MARK: - Dictionary extension
// Used to check if Dictionary already contains the key or value
extension Dictionary where Value: Equatable {
    func containsValue(value : Value) -> Bool {
        return self.contains { $0.1 == value }
    }
}
