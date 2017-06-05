//
//  File.swift
//  GOFToLambda
//
//  Created by Tomás Ruiz López on 5/6/17.
//  Copyright © 2017 Tomás Ruiz-López. All rights reserved.
//

import Foundation

enum Type : String {
    case TEXT
    case PRESENTATION
    case AUDIO
    case VIDEO
}

struct File {
    let type : Type
    let content : String
}

extension File : CustomStringConvertible {
    var description : String {
        return "\(type): \(content)"
    }
}
