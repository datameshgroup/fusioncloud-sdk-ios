//
//  InputRequest.swift
//  TestAppDM
//
//  Created by Loey Agdan on 5/7/22.
//

import Foundation
import ObjectMapper

/* Request */

public class InputRequest : Mappable{
    
    var menuEntry:[Menu]?
    var displayOutput: DisplayOutput?
    
    public required init?(map: Map) {}
    public required init(){}
    public func mapping(map: Map) {
        menuEntry       <-  map["MenuEntry"]
        displayOutput   <-  map["DisplayOutput"]
    }
}

public class InputData : Mappable {
    
    var device: String?
    var infoQuality: String?
    var inputCommand: String?
    var maxInputTime: String?
    var minLength: String?
    var maxLength: String?
    var maxCharacterFlag: String?
    var maskCharFlag: String?
    
    public required init?(map: Map) {}
    public required init(){}
    public func mapping(map: Map) {
        device          <-  map["Device"]
        infoQuality     <-  map["InfoQuality"]
        inputCommand    <-  map["InputCommand"]
        maxInputTime    <-  map["MaxInputTime"]
        minLength       <-  map["MinLength"]
        maxLength       <-  map["MaxLength"]
        maskCharFlag    <-  map["MaskCharactersFlag"]
    }
}

public class Menu: Mappable {
    
    var outputFormat:String?
    var outputText: OutputText?
    
    public required init?(map: Map) {}
    public required init(){}
    public func mapping(map: Map) {
        outputFormat        <-  map["OutputFormat"]
        outputText          <-  map["OutputText"]
    }
}

/* Input Response */

