//
//  CommandLambda.swift
//  GOFToLambda
//
//  Created by Tomás Ruiz López on 5/6/17.
//  Copyright © 2017 Tomás Ruiz-López. All rights reserved.
//

import Foundation

func log(message : String) {
    print("Logging: \(message)")
}

func save(message : String) {
    print("Saving: \(message)")
}

func send(message : String) {
    print("Sending: \(message)")
}

func execute(tasks : [() -> ()]) {
    tasks.forEach{ $0() }
}

func runCommandLambda() {
    execute(tasks: [{ log(message: "Hi") }, { save(message: "Cheers") }, { send(message: "Bye") }])
}
