//
//  StrategyLambda.swift
//  GOFToLambda
//
//  Created by Tomás Ruiz López on 5/6/17.
//  Copyright © 2017 Tomás Ruiz-López. All rights reserved.
//

import Foundation

typealias Predicate<T> = (T) -> Bool

func publish(text: String, withFilter filter : Predicate<String>, formatted : (String) -> String) {
    if filter(text) {
        print(formatted(text))
    }
}

func runStrategyLambda() {
    let errorFilter : Predicate<String> = { text in text.hasPrefix("ERROR") }
    let errorFormat : (String) -> String = { text in text.uppercased() }
    publish(text: "ERROR - something bad happened",
            withFilter: errorFilter,
            formatted: errorFormat)
    publish(text: "DEBUG - I'm here",
            withFilter: errorFilter,
            formatted: errorFormat)
}
