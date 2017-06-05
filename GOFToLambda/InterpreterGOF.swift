//
//  InterpreterGOF.swift
//  GOFToLambda
//
//  Created by Tomás Ruiz López on 5/6/17.
//  Copyright © 2017 Tomás Ruiz-López. All rights reserved.
//

import Foundation

protocol Expression {
    func interpret() -> Int
}

struct Add : Expression {
    let left : Expression
    let right : Expression
    
    func interpret() -> Int {
        return left.interpret() + right.interpret()
    }
}

struct Subtract : Expression {
    let left : Expression
    let right : Expression
    
    func interpret() -> Int {
        return left.interpret() - right.interpret()
    }
}

struct Product : Expression {
    let left : Expression
    let right : Expression
    
    func interpret() -> Int {
        return left.interpret() * right.interpret()
    }
}

struct Number : Expression {
    let n : Int
    
    func interpret() -> Int {
        return n
    }
}

func isOperator(_ s : String) -> Bool {
    return ["+", "-", "*"].contains(s)
}

func getOperator(operand : String, left : Expression, right : Expression) -> Expression? {
    switch operand {
    case "+": return Add(left: left, right: right)
    case "-": return Subtract(left: left, right: right)
    case "*": return Product(left: left, right: right)
    default: return nil
    }
}

func evaluate(expression : String) -> Int {
    var stack : [Expression] = []
    for token in expression.components(separatedBy: " ") {
        if isOperator(token) {
            let right = stack.popLast()!
            let left = stack.popLast()!
            stack.append(getOperator(operand: token, left: left, right: right)!)
        } else {
            stack.append(Number(n: Int(token)!))
        }
    }
    return stack.popLast()!.interpret()
}

func runInterpreterGOF() {
    let expression = "7 3 - 2 1 + *"
    print(evaluate(expression: expression))
}


