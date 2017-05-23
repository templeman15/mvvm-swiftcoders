//
//  Car.swift
//  MVVM SwiftCoders
//
//  Created by Steven Templeman on 5/18/17.
//  Copyright © 2017 Coplex. All rights reserved.
//

import Foundation
import ObjectMapper

struct Car {
    let make: String
    let model: String
    let fuelRemaining: Float
    
    func takeOnTestDrive() -> Car {
        guard fuelRemaining > 0 else { return self }
        let fuelUsed = min(0.25, fuelRemaining)
        
        return Car(self, fuelRemaining: fuelRemaining - fuelUsed)
    }
}

extension Car {
    init(_ car: Car, make: String? = nil, model: String? = nil, fuelRemaining: Float? = nil) {
        self.init(make: make ?? car.make,
                  model: model ?? car.model,
                  fuelRemaining: fuelRemaining ?? car.fuelRemaining)
    }
}

// MARk: - JSON

extension Car: ImmutableMappable {
    init(map: Map) throws {
        make = try map.value("make")
        model = try map.value("model")
        fuelRemaining = try map.value("fuel_remaining")
    }
}
