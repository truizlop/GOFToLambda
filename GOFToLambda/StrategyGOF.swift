//
//  StrategyGOF.swift
//  GOFToLambda
//
//  Created by Tomás Ruiz López on 5/6/17.
//  Copyright © 2017 Tomás Ruiz-López. All rights reserved.
//

import Foundation

protocol TextFormatter {
    func filter(text : String) -> Bool
    func format(text : String) -> String
}

struct PlainTextFormatter : TextFormatter {
    func filter(text: String) -> Bool {
        return true
    }
    
    func format(text: String) -> String {
        return text
    }
}

struct ErrorTextFormatter : TextFormatter {
    func filter(text: String) -> Bool {
        return text.hasPrefix("ERROR")
    }
    
    func format(text: String) -> String {
        return text.uppercased()
    }
}

struct ShortTextFormatter : TextFormatter {
    func filter(text: String) -> Bool {
        return text.count < 20
    }
    
    func format(text: String) -> String {
        return text.lowercased()
    }
}

struct TextEditor {
    let formatter : TextFormatter
    
    func publish(text : String) {
        if formatter.filter(text: text) {
            print(formatter.format(text: text))
        }
    }
}

func runStrategyGOF() {
    let editor = TextEditor(formatter: ErrorTextFormatter())
    editor.publish(text: "ERROR - something bad happened")
    editor.publish(text: "DEBUG - I'm here")
}
