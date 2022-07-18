//
//  SalePOIRequest.swift
//  FusionCloud
//
//  Created by Loey Agdan on 7/17/22.
//

import Foundation
import ObjectMapper

public class SalePOIRequest : Mappable{
    
    public var messageHeader: MessageHeader?
    public var loginRequest: LoginRequest?
    public var securityTrailer: SecurityTrailer?
    public var displayRequest: DisplayRequest?
    
    
    public required init?(map: Map) {}
    public required init() {}
    public func mapping(map: Map) {
        messageHeader   <- map["MessageHeader"]
        loginRequest    <- map["LoginRequest"]
        displayRequest  <-  map["DisplayRequest"]
        securityTrailer <- map["SecurityTrailer"]
        
    }
}
