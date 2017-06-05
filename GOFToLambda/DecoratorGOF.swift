//
//  DecoratorGOF.swift
//  GOFToLambda
//
//  Created by Tomás Ruiz López on 5/6/17.
//  Copyright © 2017 Tomás Ruiz-López. All rights reserved.
//

import Foundation

protocol SalaryCalculator {
    func calculate(grossAnnual : Double) -> Double
}

class DefaultSalaryCalculator : SalaryCalculator {
    func calculate(grossAnnual: Double) -> Double {
        return grossAnnual / 12
    }
}

class AbstractTaxDecorator : SalaryCalculator {
    fileprivate let salaryCalculator : SalaryCalculator
    
    init(_ salaryCalculator : SalaryCalculator) {
        self.salaryCalculator = salaryCalculator
    }
    
    func applyTax(_ salary : Double) -> Double {
        fatalError("Implement apply tax in subclass")
    }
    
    func calculate(grossAnnual: Double) -> Double {
        let salary = salaryCalculator.calculate(grossAnnual: grossAnnual)
        return applyTax(salary)
    }
}

class GeneralTaxDecorator : AbstractTaxDecorator {
    override func applyTax(_ salary: Double) -> Double {
        return generalTax(salary)
    }
}

class RegionalTaxDecorator : AbstractTaxDecorator {
    override func applyTax(_ salary: Double) -> Double {
        return regionalTax(salary)
    }
}

class HealthInsuranceTaxDecorator : AbstractTaxDecorator {
    override func applyTax(_ salary: Double) -> Double {
        return healthInsurance(salary)
    }
}

func runDecoratorGOF() {
    let salaryCalculator = HealthInsuranceTaxDecorator(
                            RegionalTaxDecorator(
                             GeneralTaxDecorator(
                              DefaultSalaryCalculator()
                             )
                            )
                           )
    print(salaryCalculator.calculate(grossAnnual: 30000.00))
}
