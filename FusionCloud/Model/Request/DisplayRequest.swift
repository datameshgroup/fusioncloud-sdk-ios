//
//  DisplayRequest.swift
//  TestAppDM
//
//  Created by Loey Agdan on 4/20/22.
//

import Foundation
import ObjectMapper



public class DisplayRequest: Mappable {
    public var displayOutput: DisplayOutput?
    
    public func mapping(map: Map) {
        displayOutput    <-  map["DisplayOutput"]
    }
    
    public required init?(map: Map) {}
    public required init(){}
}

public class DisplayOutput: Mappable {
    
    public var responseFlag: Bool?
    public var device: String?
    public var infoQuality: String?
    public var outputContent: OutputContent?
    
    public func mapping(map: Map) {
        responseFlag    <-  map["ResponseRequiredFlag"]
        device          <-  map["Device"]
        infoQuality     <-  map["InfoQuality"]
        outputContent   <-  map["OutputContent"]
    }
    public required init?(map: Map) {}
    public required init(){}
}

    public class OutputContent: Mappable {
        
        public var outputFormat: String?
        public var outputText: OutputText?
        public var outputXHTML: String?
        
        public func mapping(map: Map) {
            outputFormat    <-  map["OutputFormat"]
            outputText      <-  map["OutputText"]
            outputXHTML     <-  map["OutputXHTML"]
        }
        
        public required init?(map: Map) {}
        public required init(){}
    }

        public class OutputText: Mappable {
            var text: String?
            
            public func mapping(map: Map) {
                text    <-  map["Text"]
            }
            
            public required init?(map: Map) {}
            public required init(){}
        }
