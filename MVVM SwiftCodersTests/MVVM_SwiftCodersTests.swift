//
//  MVVM_SwiftCodersTests.swift
//  MVVM SwiftCodersTests
//
//  Created by Steven Templeman on 5/21/17.
//  Copyright © 2017 Coplex. All rights reserved.
//

import XCTest
@testable import MVVM_SwiftCoders

class MVVM_SwiftCodersTests: XCTestCase {
    func testModel() {
        let car = Car(make: "", model: "Civic", fuelRemaining: 0.0)
        let viewModel = CarDetailViewModel(car: car)
        
        XCTAssertEqual(viewModel.model, "Civic")
    }
    
    func testMakeUppercasedIfLexus() {
        let car = Car(make: "Lexus", model: "", fuelRemaining: 0.0)
        let viewModel = CarDetailViewModel(car: car)
        
        XCTAssertEqual(viewModel.make, "LEXUS")
    }
    
    func testMakeNotUppercasedWhenNotLexus() {
        let car = Car(make: "Ford", model: "", fuelRemaining: 0.0)
        let viewModel = CarDetailViewModel(car: car)
        
        XCTAssertEqual(viewModel.make, "Ford")
    }
    
    func testTestFuelRemainingUnderQuarterTank() {
        let car = Car(make: "", model: "", fuelRemaining: 0.2)
        let viewModel = CarDetailViewModel(car: car)
        
        XCTAssertEqual(viewModel.fuelRemaining, "Get gas now! Remaining: 0.2")
    }
    
    func testTestFuelRemainingUnderHalfTank() {
        let car = Car(make: "", model: "", fuelRemaining: 0.4)
        let viewModel = CarDetailViewModel(car: car)
        
        XCTAssertEqual(viewModel.fuelRemaining, "Running low! Remaining: 0.4")
    }
    
    func testTestFuelRemainingOverHalfTank() {
        let car = Car(make: "", model: "", fuelRemaining: 0.8)
        let viewModel = CarDetailViewModel(car: car)
        
        XCTAssertEqual(viewModel.fuelRemaining, "Remaining: 0.8")
    }
}
