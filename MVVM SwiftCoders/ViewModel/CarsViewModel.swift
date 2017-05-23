//
//  CarsViewModel.swift
//  MVVM SwiftCoders
//
//  Created by Steven Templeman on 5/22/17.
//  Copyright © 2017 Coplex. All rights reserved.
//

import Foundation
import Moya_ObjectMapper
import RxSwift
import RxCocoa
import Moya

struct CarsViewModel {
    
    // MARK: - Outputs
    
    let cars: Driver<[Car]>
    let title: Driver<String>
    
    // MARK: - Init
    
    init(provider: RxMoyaProvider<ApiService>, search: Driver<String>) {
        cars = search
            .throttle(0.25)
            .distinctUntilChanged()
            .flatMapLatest {
                provider.request(.cars(query: $0))
                    .retry(3)
                    .mapArray(Car.self)
                    .asDriver(onErrorJustReturn: [])
        }
        
        title = search
            .map { query in
                query.isEmpty ? "Dealership Inventory" : "Searching: \(query)"
        }
    }
}
