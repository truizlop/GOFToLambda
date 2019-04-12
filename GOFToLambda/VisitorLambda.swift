//
//  VisitorLambda.swift
//  GOFToLambda
//
//  Created by Tomás Ruiz López on 5/6/17.
//  Copyright © 2017 Tomás Ruiz-López. All rights reserved.
//

import Foundation

enum Shape {
    case square(side: Double)
    case circle(radius: Double)
    case rectangle(width: Double, height: Double)
}

extension Shape {
    func area() -> Double {
        switch self {
        case .square(let side):
            return side * side
        case .circle(let radius):
            return radius * radius * .pi
        case .rectangle(let width, let height):
            return height * width
        }
    }
}

extension Shape {
    func perimeter() -> Double {
        switch self {
        case .square(let side):
            return 4 * side
        case .circle(let radius):
            return 2 * .pi * radius
        case .rectangle(let width, let height):
            return 2 * width + 2 * height
        }
    }
}

func sumOn<A, B: Numeric>(_ xs: [A], _ f: (A) -> B) -> B {
    return xs.map(f).reduce(0, +)
}

func runVisitorLambda() {
    let figures: [Shape] = [
        .circle(radius: 4),
        .square(side: 5),
        .rectangle(width: 6, height: 7)
    ]

    print("Total area = \(sumOn(figures) { $0.area() })")
    print("Total perimeter = \(sumOn(figures) { $0.perimeter() })")
}
