//
//  TransactionStatusRequest.swift
//  TestAppDM
//
//  Created by Loey Agdan on 5/8/22.
//

import Foundation
import ObjectMapper

public class TransactionStatusRequest: Mappable {
    
    
    public var messageRef: MessageReference?
    
    public required init?(map: Map) {}
    public required init(){}
    public func mapping(map: Map) {
        messageRef     <-  map["MessageReference"]
    }
}

public class MessageReference: Mappable {
    
    public var messageCategory: String?
    public var serviceId: String?
    public var saleID: String?
    public var poiId: String?
    
    public required init?(map: Map) {}
    public required init(){}
    public func mapping(map: Map) {
        messageCategory <-      map["MessageCategory"]
        serviceId       <-      map["ServiceID"]
        saleID          <-      map["SaleID"]
        poiId           <-      map["POIID"]
    }
}
