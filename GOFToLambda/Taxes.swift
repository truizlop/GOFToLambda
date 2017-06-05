//
//  Taxes.swift
//  GOFToLambda
//
//  Created by Tomás Ruiz López on 5/6/17.
//  Copyright © 2017 Tomás Ruiz-López. All rights reserved.
//

import Foundation

func generalTax(_ salary : Double) -> Double {
    return 0.8 * salary
}

func regionalTax(_ salary : Double) -> Double {
    return 0.95 * salary
}

func healthInsurance(_ salary : Double) -> Double {
    return salary - 200
}
