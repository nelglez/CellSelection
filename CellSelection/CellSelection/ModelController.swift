//
//  ModelController.swift
//  CellSelection
//
//  Created by Spencer Curtis on 5/9/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ModelController {
    
    init() {
        saveMockData()
        loadMockData()
    }
    
    func saveMockData() {
        
        guard UserDefaults.standard.bool(forKey: "MockDataHasBeenCreated") == false else { return }
        
        let mockData = ["foo", "bar", "baz"]
        
        let encoder = PropertyListEncoder()
        
        do {
            let data = try encoder.encode(mockData)
            
            let url = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("data").appendingPathExtension("plist")
            
            try data.write(to: url)
            
            UserDefaults.standard.set(true, forKey: "MockDataHasBeenCreated")
        } catch {
            NSLog("Error: \(error)")
        }
    }
    
    func loadMockData() {
        
        do {
        let url = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("data").appendingPathExtension("plist")
        
            let data = try Data(contentsOf: url)
            
            let decoder = PropertyListDecoder()
            
            self.models = try decoder.decode([String].self, from: data)
        } catch {
            NSLog("Error: \(error)")
        }
    }
    
    func saveModelsToUserDefaults() {
        
        var personDictionaries: [[String: Any]] = []
        
        for person in people {
            let personDictionary = person.dictionaryRepresentation
            
            personDictionaries.append(personDictionary)
        }
        
        UserDefaults.standard.set(personDictionaries, forKey: "People")
        
    }
    // Assume we actually have people in this array
    var people: [Person] = []
    
    var models: [String] = []

}
