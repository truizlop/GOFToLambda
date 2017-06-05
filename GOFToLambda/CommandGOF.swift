//
//  CommandGOF.swift
//  GOFToLambda
//
//  Created by Tomás Ruiz López on 5/6/17.
//  Copyright © 2017 Tomás Ruiz-López. All rights reserved.
//

import Foundation

protocol Command {
    func run()
}

struct Logger : Command {
    let message : String
    
    func run() {
        print("Logging: \(message)")
    }
}

struct FileSaver : Command {
    let message : String
    
    func run() {
        print("Saving: \(message)")
    }
}

struct Mailer : Command {
    let message : String
    
    func run() {
        print("Sending: \(message)")
    }
}

struct Executor {
    func execute(tasks : [Command]) {
        for task in tasks {
            task.run()
        }
    }
}

func runCommandGOF() {
    let tasks : [Command] = [
        Logger(message: "Hi"),
        FileSaver(message: "Cheers"),
        Mailer(message: "Bye")
    ]
    
    Executor().execute(tasks: tasks)
}
