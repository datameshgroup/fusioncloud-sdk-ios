//
//  CardAcquisitionRequest.swift
//  TestAppDM
//
//  Created by Loey Agdan on 5/8/22.
//

import Foundation
import ObjectMapper

public class CardAcquisitionRequest: Mappable {
    
    public var saleData: SaleData?
    public var cardAcquisitionTrans: CardAcquisitionTrans?
    
    public required init?(map: Map) {}
    public required init(){}
    public func mapping(map: Map) {
        saleData                <-  map["SaleData"]
        cardAcquisitionTrans    <-  map["CardAcquisitionTransaction"]
    }
}

public class CardAcquisitionTrans: Mappable {
    
    public var allowedPaymentBrnd: [String]?
    public var forceEntryMode: String?
    
    public required init?(map: Map) {}
    public required init(){}
    public func mapping(map: Map) {
        allowedPaymentBrnd      <-  map["AllowedPaymentBrand"]
        forceEntryMode          <-  map["ForceEntryMode"]
    }
}


