//
//  SomeClass.swift
//  CellSelection
//
//  Created by Spencer Curtis on 5/9/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class Person {
    
    var name: String = ""
    var age: Int = 0 // = nil
    
    var dictionaryRepresentation: [String: Any] {
        return ["name": name,
                "age": age]
    }
    
    init?(dictionary: [String: Any]) {
        // Still need to implement this
    }
    
    // You need an initializer if ANY properties aren't optional or don't have an initial value.
}
