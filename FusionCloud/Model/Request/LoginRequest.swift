//
//  LoginRequest.swift
//  TestApplication
//
//  Created by loey on 2/6/22.
//  Copyright © 2022 loey. All rights reserved.
//

import Foundation
import ObjectMapper

public class LoginRequest: Mappable{
    
    public var dateTime: String?
    public var saleSoftware : SaleSoftware?
    public var saleTerminalData : SaleTerminalData?
    public var trainingModeFlag: Bool?
    public var operatorLanguage: String?
    public var operatorId: String?
    
    public required init?(map: Map) {}
    public required init(){}
    public func mapping(map: Map) {
        dateTime            <- map["DateTime"]
        saleSoftware        <- map["SaleSoftware"]
        saleTerminalData    <- map["SaleTerminalData"]
        trainingModeFlag    <- map["TrainingModeFlag"]
        operatorLanguage    <- map["OperatorLanguage"]
        operatorId          <- map["OperatorID"]
    }
    
}


public class SaleSoftware: Mappable {
    
    public var providerIdentification: String?
    public var ApplicationName: String?
    public var softwareVersion: String?
    public var certificationCode: String?
    public var componentType: String?
    
    public required init(){}
    public required init?(map: Map) {}
       public func mapping(map: Map) {
           providerIdentification   <- map["ProviderIdentification"]
           ApplicationName          <- map["ApplicationName"]
           softwareVersion          <- map["SoftwareVersion"]
           certificationCode        <- map["CertificationCode"]
           componentType            <- map["ComponentType"]
       }
}

public class SaleTerminalData: Mappable {
    
    public var terminalEnvironment: String?
    public var saleCapabilities: [String]?
    public var saleProfile: SaleProfile?
    
    public required init(){}
     public required init?(map: Map) {}
     public func mapping(map: Map) {
        terminalEnvironment     <- map["TerminalEnvironment"]
        saleCapabilities        <- map["SaleCapabilities"]
        saleProfile             <- map["SaleProfile"]
     }
}

public class SaleProfile: Mappable {
    
    public var genericProfile: String?
    public var serviceProfiles: [String]?
    
    public required init(){}
      public required init?(map: Map) {}
      public func mapping(map: Map) {
         genericProfile <- map["GenericProfile"]
         serviceProfiles <- map["ServiceProfiles"]
      }
}
