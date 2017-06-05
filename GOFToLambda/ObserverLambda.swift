//
//  ObserverLambda.swift
//  GOFToLambda
//
//  Created by Tomás Ruiz López on 5/6/17.
//  Copyright © 2017 Tomás Ruiz-López. All rights reserved.
//

import Foundation

typealias ListenerLambda = (AnyObject) -> ()

class ObservableLambda<T : Hashable> {
    private var listeners : [T : ListenerLambda] = [:]
    
    func register(key : T, listener : @escaping ListenerLambda) {
        listeners[key] = listener
    }
    
    func unregister(key : T) {
        listeners.removeValue(forKey: key)
    }
    
    func send(event : AnyObject) {
        listeners.values.forEach{ listener in listener(event) }
    }
}

func runObserverLambda() {
    let observable = ObservableLambda<String>()
    observable.register(key: "Observer1", listener: { event in print("Observer1: \(event)") })
    observable.register(key: "Observer2", listener: { event in print("Observer2: \(event)") })
    
    observable.send(event: "Hello World!" as AnyObject)
}
