//
//  CarDetailViewModel.swift
//  MVVM SwiftCoders
//
//  Created by Steven Templeman on 5/21/17.
//  Copyright © 2017 Coplex. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct CarDetailViewModel {
    // MARK: - Outputs
    
    let make: Driver<String>
    let model: Driver<String>
    let fuelRemaining: Driver<String>
    let title: Driver<String>

    // MARK: Init
    
    init(car: Car, testDriveTapped: Driver<Void>) {
        let carDriver = testDriveTapped
            .scan(car) { $0.0.takeOnTestDrive() }
            .startWith(car)
        
        model = carDriver.map { $0.model }
        title = carDriver.map { "\($0.make) \($0.model)".uppercased() }
        
        make = carDriver.map { car in
            if car.make == "Lexus" {
                return car.make.uppercased()
            }
            return car.make
        }
        
        fuelRemaining = carDriver.map { car in
            var remainingText = "Remaining: \(car.fuelRemaining)"
            switch car.fuelRemaining {
            case 0.0..<0.25:
                remainingText = "Get gas now! \(remainingText)"
            case 0.25..<0.5:
                remainingText = "Running low! \(remainingText)"
            default:
                break
            }
            return remainingText
        }
    }
}
