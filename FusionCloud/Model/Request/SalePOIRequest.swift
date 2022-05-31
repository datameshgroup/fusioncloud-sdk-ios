//
//  SalePOIRequest.swift
//  TestApplication
//
//  Created by loey on 1/30/22.
//  Copyright © 2022 loey. All rights reserved.
//

import Foundation
import ObjectMapper


public class SalePOIRequest : Mappable{
    
    public var messageHeader: MessageHeader?
    public var loginRequest: LoginRequest?
    public var securityTrailer: SecurityTrailer?
    
    public required init?(map: Map) {}
    public required init() {}
    public func mapping(map: Map) {
        messageHeader   <- map["MessageHeader"]
        loginRequest    <- map["LoginRequest"]
        securityTrailer <- map["SecurityTrailer"]
    }
}
