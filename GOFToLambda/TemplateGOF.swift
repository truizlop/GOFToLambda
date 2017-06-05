//
//  TemplateGOF.swift
//  GOFToLambda
//
//  Created by Tomás Ruiz López on 5/6/17.
//  Copyright © 2017 Tomás Ruiz-López. All rights reserved.
//

import Foundation

class AbstractResourceManipulatorTemplate {
    fileprivate var resource : Resource?
    
    private func openResource() {
        resource = Resource()
    }
    
    fileprivate func doSomethingWithResource() throws {
        fatalError("Override doSomethingWithResource in subclass")
    }
    
    private func closeResource() {
        resource?.dispose()
        resource = nil
    }
    
    func execute() {
        openResource()
        do {
            try doSomethingWithResource()
        } catch {}
        closeResource()
    }
}

class ResourceUser : AbstractResourceManipulatorTemplate {
    override func doSomethingWithResource() throws {
        try resource?.use()
    }
}

class ResourceEmployer : AbstractResourceManipulatorTemplate {
    override func doSomethingWithResource() throws {
        try resource?.employ()
    }
}

func runTemplateGOF() {
    ResourceUser().execute()
    ResourceEmployer().execute()
}
