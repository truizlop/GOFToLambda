//
//  ChainOfResponsibilityLambda.swift
//  GOFToLambda
//
//  Created by Tomás Ruiz López on 5/6/17.
//  Copyright © 2017 Tomás Ruiz-López. All rights reserved.
//

import Foundation

extension Optional {
    func filter(_ predicate : (Wrapped) -> Bool) -> Optional<Wrapped> {
        switch self {
        case .none: return nil
        case let .some(value): return predicate(value) ? self : nil
        }
    }
}

func parseText(file : File) -> String? {
    return Optional.some(file)
        .filter{ f in f.type == .TEXT }
        .map{ f in "Text file: \(f.content)" }
}

func parsePresentation(file : File) -> String? {
    return Optional.some(file)
        .filter{ f in f.type == .PRESENTATION }
        .map{ f in "Presentation file: \(f.content)" }
}

func parseAudio(file : File) -> String? {
    return Optional.some(file)
        .filter{ f in f.type == .AUDIO }
        .map{ f in "Audio file: \(f.content)" }
}

func parseVideo(file : File) -> String? {
    return Optional.some(file)
        .filter{ f in f.type == .VIDEO }
        .map{ f in "Video file \(f.content)" }
}

func runChainOfResponsibilityLambda() {
    let song = File(type: .AUDIO, content: "Dream Theater - The Astonishing")
    
    let result = [parseText, parsePresentation, parseAudio, parseVideo]
                .compactMap{ f in f(song) }.first
    
    if let result = result {
        print(result)
    } else {
        fatalError("Unknown file: \(song)")
    }
    
}
