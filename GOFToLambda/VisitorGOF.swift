//
//  VisitorGOF.swift
//  GOFToLambda
//
//  Created by Tomás Ruiz López on 5/6/17.
//  Copyright © 2017 Tomás Ruiz-López. All rights reserved.
//

import Foundation

protocol Visitor {
    associatedtype T
    
    func visit(_ square : Square) -> T
    func visit(_ circle : Circle) -> T
    func visit(_ rectangle : Rectangle) -> T
}

protocol Element {
    func accept<T, U>(visitor : U) -> T where U : Visitor, U.T == T
}

struct Square : Element {
    let side : Double
    
    func accept<T, U>(visitor: U) -> T where U : Visitor, U.T == T {
        return visitor.visit(self)
    }
}

struct Circle : Element {
    let radius : Double
    
    func accept<T, U>(visitor: U) -> T where U : Visitor, U.T == T {
        return visitor.visit(self)
    }
}

struct Rectangle : Element {
    let width : Double
    let height : Double
    
    func accept<T, U>(visitor: U) -> T where U : Visitor, U.T == T {
        return visitor.visit(self)
    }
}

struct AreaVisitor : Visitor {
    func visit(_ square : Square) -> Double {
        return square.side * square.side
    }
    
    func visit(_ circle : Circle) -> Double {
        return circle.radius * circle.radius * .pi
    }
    
    func visit(_ rectangle : Rectangle) -> Double {
        return rectangle.width * rectangle.height
    }
}

struct PerimeterVisitor : Visitor {
    func visit(_ square : Square) -> Double {
        return 4 * square.side
    }
    
    func visit(_ circle : Circle) -> Double {
        return 2 * .pi * circle.radius
    }
    
    func visit(_ rectangle : Rectangle) -> Double {
        return 2 * rectangle.width + 2 * rectangle.height
    }
}

func runVisitorGOF() {
    let figures : [Element] = [ Circle(radius: 4), Square(side: 5), Rectangle(width: 6, height: 7) ]
    
    var area = 0.0
    let areaVisitor = AreaVisitor()
    for figure in figures {
        area += figure.accept(visitor: areaVisitor)
    }
    print("Total area = \(area)")

    var perimeter = 0.0
    let perimeterVisitor = PerimeterVisitor()
    for figure in figures {
        perimeter += figure.accept(visitor: perimeterVisitor)
    }
    print("Total perimeter = \(perimeter)")
}




