//
//  ObserverGOF.swift
//  GOFToLambda
//
//  Created by Tomás Ruiz López on 5/6/17.
//  Copyright © 2017 Tomás Ruiz-López. All rights reserved.
//

import Foundation

protocol Listener {
    func onEvent(_ event : AnyObject)
}

class Observable<T : Hashable> {
    private var listeners : [T : Listener] = [:]
    
    func register(key : T, listener : Listener) {
        listeners[key] = listener
    }
    
    func unregister(key : T) {
        listeners.removeValue(forKey: key)
    }
    
    func send(event : AnyObject) {
        for (_, listener) in listeners {
            listener.onEvent(event)
        }
    }
}

class Observer1 : Listener {
    init(observable : Observable<String>) {
        observable.register(key: "Observer1", listener: self)
    }
    
    func onEvent(_ event: AnyObject) {
        print("Observer1: \(event)")
    }
}

class Observer2 : Listener {
    init(observable : Observable<String>) {
        observable.register(key: "Observer2", listener: self)
    }
    
    func onEvent(_ event: AnyObject) {
        print("Observer2: \(event)")
    }
}

func runObserverGOF() {
    let observable = Observable<String>()
    let _ = Observer1(observable: observable)
    let _ = Observer2(observable: observable)
    
    observable.send(event: "Hello World!" as AnyObject)
}

