//
//  DecoratorLambda.swift
//  GOFToLambda
//
//  Created by Tomás Ruiz López on 5/6/17.
//  Copyright © 2017 Tomás Ruiz-López. All rights reserved.
//

import Foundation

func defaultSalary(_ grossAnnual : Double) -> Double {
    return grossAnnual / 12
}

infix operator |> : AdditionPrecedence

func |> <T, U, V>(_ f : @escaping (T) -> U, _ g : @escaping (U) -> V) -> (T) -> V {
    return { t in g(f(t)) }
}

func runDecoratorLambda() {
    let salary = (defaultSalary
                    |> generalTax
                    |> regionalTax
                    |> healthInsurance)(30000.00)
    print("Salary: \(salary)")
}
