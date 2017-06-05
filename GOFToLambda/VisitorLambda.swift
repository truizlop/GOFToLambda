//
//  VisitorLambda.swift
//  GOFToLambda
//
//  Created by Tomás Ruiz López on 5/6/17.
//  Copyright © 2017 Tomás Ruiz-López. All rights reserved.
//

import Foundation

enum Shape {
    case square(_ : Square2)
    case circle(_ : Circle2)
    case rectangle(_ : Rectangle2)
    
    func accept<T>(onSquare : (Square2) -> T,
                onCircle : (Circle2) -> T,
                onRectangle : (Rectangle2) -> T) -> T {
        switch self {
            case let .square(square): return onSquare(square)
            case let .circle(circle): return onCircle(circle)
            case let .rectangle(rectangle): return onRectangle(rectangle)
        }
    }
}

struct Square2 {
    let side : Double
}

struct Circle2 {
    let radius : Double
}

struct Rectangle2 {
    let width : Double
    let height : Double
}

func runVisitorLambda() {
    let figures : [Shape] = [.circle(Circle2(radius: 4)), .square(Square2(side: 5)), .rectangle(Rectangle2(width: 6, height: 7))]
    
    let totalArea = figures.map{
        $0.accept(onSquare: { square in square.side * square.side },
                  onCircle: { circle in circle.radius * circle.radius * .pi },
                  onRectangle: { rectangle in rectangle.height * rectangle.width })
        }.reduce(0, +)
    print("Total area = \(totalArea)")
    
    let totalPerimeter = figures.map{
        $0.accept(onSquare: { square in 4 * square.side },
                  onCircle: { circle in 2 * .pi * circle.radius },
                  onRectangle: { rectangle in 2 * rectangle.width + 2 * rectangle.height })
        }.reduce(0, +)
    print("Total perimeter = \(totalPerimeter)")
}




