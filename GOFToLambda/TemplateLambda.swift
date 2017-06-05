//
//  TemplateLambda.swift
//  GOFToLambda
//
//  Created by Tomás Ruiz López on 5/6/17.
//  Copyright © 2017 Tomás Ruiz-López. All rights reserved.
//

import Foundation

func withResource(_ operation : (Resource) throws -> ()) {
    let resource = Resource()
    do {
        try operation(resource)
    } catch {}
    resource.dispose()
}

func runTemplateLambda() {
    withResource{ resource in try resource.use() }
    withResource{ resource in try resource.employ() }
}
