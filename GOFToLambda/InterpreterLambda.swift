//
//  InterpreterLambda.swift
//  GOFToLambda
//
//  Created by Tomás Ruiz López on 5/6/17.
//  Copyright © 2017 Tomás Ruiz-López. All rights reserved.
//

import Foundation

func evaluateLambda(expression : String) -> Int {
    var stack : [Int] = []
    let opMap : [String : (Int, Int) -> Int] = [
        "+" : { a, b in a + b },
        "-" : { a, b in a - b },
        "*" : { a, b in a * b }
    ]
    
    for token in expression.components(separatedBy: " ") {
        if let operation = opMap[token] {
            let right = stack.popLast()!
            let left = stack.popLast()!
            stack.append(operation(left, right))
        } else {
            stack.append(Int(token)!)
        }
    }
    return stack.popLast()!
}

func runInterpreterLambda() {
    let expression = "7 3 - 2 1 + *"
    print(evaluateLambda(expression: expression))
}
