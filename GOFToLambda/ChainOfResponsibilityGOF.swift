//
//  ChainOfResponsibilityGOF.swift
//  GOFToLambda
//
//  Created by Tomás Ruiz López on 5/6/17.
//  Copyright © 2017 Tomás Ruiz-López. All rights reserved.
//

import Foundation

protocol FileParser {
    func parse(file : File) -> String
    func setNext(parser : FileParser)
}

class AbstractFileParser : FileParser {
    fileprivate var next : FileParser?
    
    func parse(file: File) -> String {
        fatalError("Parse is not implemented")
    }
    
    func setNext(parser: FileParser) {
        self.next = parser
    }
}

class TextFileParser : AbstractFileParser {
    override func parse(file: File) -> String {
        if file.type == .TEXT {
            return "Text file: \(file.content)"
        } else if let next = self.next {
            return next.parse(file: file)
        } else {
            fatalError("Unknown file: \(file)")
        }
    }
}

class PresentationFileParser : AbstractFileParser {
    override func parse(file: File) -> String {
        if file.type == .TEXT {
            return "Presentation file: \(file.content)"
        } else if let next = self.next {
            return next.parse(file: file)
        } else {
            fatalError("Unknown file: \(file)")
        }
    }
}

class AudioFileParser : AbstractFileParser {
    override func parse(file: File) -> String {
        if file.type == .AUDIO {
            return "Audio file: \(file.content)"
        } else if let next = self.next {
            return next.parse(file: file)
        } else {
            fatalError("Unknown file: \(file)")
        }
    }
}

class VideoFileParser : AbstractFileParser {
    override func parse(file: File) -> String {
        if file.type == .VIDEO {
            return "Video file: \(file.content)"
        } else if let next = self.next {
            return next.parse(file: file)
        } else {
            fatalError("Unknown file: \(file)")
        }
    }
}

func runChainOfResponsibilityGOF() {
    let textParser = TextFileParser()
    let presentationParser = PresentationFileParser()
    let audioParser = AudioFileParser()
    let videoParser = VideoFileParser()
    
    textParser.setNext(parser: presentationParser)
    presentationParser.setNext(parser: audioParser)
    audioParser.setNext(parser: videoParser)
    
    let song = File(type: .AUDIO, content: "Dream Theater - The Astonishing")
    print(textParser.parse(file: song))
}



