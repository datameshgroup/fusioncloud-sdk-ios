//
//  LoginResponse.swift
//  TestAppDM
//
//  Created by Loey Agdan on 4/15/22.
//

import Foundation
import ObjectMapper


public class LoginResponse: Mappable{
    
    public var response: Response?
    public var poiSystemData: POISystemData?
    
    public func mapping(map: Map) {
        response        <-  map["Response"]
        poiSystemData   <-  map["POISystemData"]
    }
    
    
    public required init?(map: Map) {}
    public required init(){}
}


public class Response : Mappable {
    public var result: String?
    public var errorCondition: String?
    public var additionalResponse: String?
    

    public func mapping(map: Map) {
        result              <-  map["Result"]
        errorCondition      <-  map["ErrorCondition"]
        additionalResponse  <-  map["AdditionalResponse"]
    }
    
    public func isSuccess() -> Bool {
        let r = result?.uppercased() ?? "";
        return (r == "SUCCESS") || (r == "PARTIAL")
    }
    
    public required init?(map: Map) {}
    public required init(){}
}


public class POISystemData : Mappable {
    
    public var dateTime: String?
    public var poiTerminalData: POITerminalData?
    public var poiStatus: POIStatus?
    public var tokenRequestStatus: Bool?
    
    public func mapping(map: Map) {
        dateTime            <-  map["DateTime"]
        poiTerminalData     <-  map["POITerminalData"]
        poiStatus           <-  map["POIStatus"]
        tokenRequestStatus  <-  map["TokenRequestStatus"]
    }
    
    public required init?(map: Map) {}
    public required init(){}
}

    public class POITerminalData : Mappable {
        
        var terminalEnvironment: String?
        var poiCapabilities: [String]?
        var poiProfile: POIProfile?
        var poiSerialNumber: String?
        
        public func mapping(map: Map) {
            terminalEnvironment     <-  map["TerminalEnvironment"]
            poiCapabilities         <-  map["POICapabilities"]
            poiProfile              <-  map["POIProfile"]
            poiSerialNumber         <-  map["POISerialNumber"]
        }
        
        public required init?(map: Map) {}
        public required init(){}
    }

        public class POIProfile : Mappable {
            
            public var genericProfile: String?
            
            public func mapping(map: Map) {
                genericProfile    <-  map["GenericProfile"]
            }
            
            public required init?(map: Map) {}
            public required init(){}
        }

public class POIStatus : Mappable {
    
    public var globalStatus: String?
    public var PEDOKFlag: Bool?
    public var cardReaderOKFlag: Bool?
    public var printerStatus: String?
    public var communicationOKFlag: Bool?
    public var fraudPreventionFlag: Bool?
    
    public func mapping(map: Map) {
        globalStatus        <-  map["GlobalStatus"]
        PEDOKFlag           <-  map["PEDOKFlag"]
        cardReaderOKFlag    <-  map["CardReaderOKFlag"]
        printerStatus       <-  map["PrinterStatus"]
        communicationOKFlag         <-  map["CommunicationOKFlag"]
        fraudPreventionFlag       <-  map["FraudPreventionFlag"]
    }
    
    public required init?(map: Map) {}
    public required init(){}
}



