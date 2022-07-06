//
//  LogoutResponse.swift
//  FusionCloud
//
//  Created by Loey Agdan on 5/30/22.
//

import Foundation
import ObjectMapper

public class LogoutResponse: Mappable {
    
    public var response: String?
    public var errorCondition: String?
    public var additionalResposne: String?
    
    public required init?(map: Map) {}
    public required init(){}
    public func mapping(map: Map) {
        response     <-  map["Result"]
        errorCondition <- map["ErrorCondition"]
        additionalResposne  <-  map["AdditionalResponse"]
    }
}
