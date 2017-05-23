//
//  ApiService.swift
//  MVVM SwiftCoders
//
//  Created by Steven Templeman on 5/22/17.
//  Copyright © 2017 Coplex. All rights reserved.
//

import Foundation
import Moya

enum ApiService {
    case cars(query: String)
}

extension ApiService: TargetType {
    var baseURL: URL { return URL(string: "https://mvvm-swiftcoders.herokuapp.com/")!}
    
    var path: String {
        switch self {
        case .cars:
            return "cars"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .cars:
            return .get
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .cars(let query):
            return ["query": query]
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
        case .cars:
            return URLEncoding.default
        }
    }
    
    var sampleData: Data {
        switch self {
        case .cars:
            return "some sample json goes here".data(using: .utf8)!
        }
    }
    
    var task: Task {
        switch self {
        case .cars:
            return .request
        }
    }
}
