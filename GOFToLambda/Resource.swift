//
//  Resource.swift
//  GOFToLambda
//
//  Created by Tomás Ruiz López on 5/6/17.
//  Copyright © 2017 Tomás Ruiz-López. All rights reserved.
//

import Foundation

enum ErrorResource : Error {
    case Random
}

struct Resource {
    init() {
        print("Resource created")
    }
    
    func use() throws {
        try riskyOperation()
        print("Resource used")
    }
    
    func employ() throws {
        try riskyOperation()
        print("Resource employed")
    }
    
    func dispose() {
        print("Resource disposed")
    }
    
    private func riskyOperation() throws {
        if arc4random_uniform(10) == 0 {
            throw ErrorResource.Random
        }
    }
}
